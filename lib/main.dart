import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

DateTime  getTime()
{
  return (DateTime.now());
}

void main()
{
  runApp(const MaterialApp
  (
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: const MainBody(),
      bottomNavigationBar: BottomNavigationBar
      (
        type: BottomNavigationBarType.fixed,
        items: const
        [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Media'),
          BottomNavigationBarItem(icon: Icon(Icons.document_scanner_sharp), label: 'Documents'),
          BottomNavigationBarItem(icon: Icon(Icons.question_mark), label: 'Help'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class TopBarMenu extends StatelessWidget
{
  const TopBarMenu({super.key});
  @override
  Widget build(BuildContext context)
  {
    return Material
    (
      child: Container
      (
        color: Color(0xFF007BFF),
        height: 25,
        child: Row
        (
          children:
          [
            Expanded
            (
              flex: 1,
              child: Center
              (
                child: ElevatedButton
                (
                  onPressed: () {},
                  style: ElevatedButton.styleFrom
                  (
                    backgroundColor: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.circular(9),
                    )
                  ),
                  child: const Text('Services', style: TextStyle(color: Color(0xFF82BFFF)),),
                )
              ),
            ),
            Expanded
            (
              flex: 1,
              child: Center
              (
                child: ElevatedButton
                (
                  onPressed: () {},
                  style: ElevatedButton.styleFrom
                  (
                    backgroundColor: Color(0xFF82BFFF),
                    shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.circular(9),
                    )
                  ),
                  child: const Text('Most Used Services', style: TextStyle(color: Colors.white),),
                )
              ),
            ),
          ],
        )
        
      )
    );
  }
}

class TopBar extends StatelessWidget
{
  const TopBar({super.key});
  @override
  Widget build(BuildContext context)
  {
    return Material
    (
     child: Container
        (
          color: const Color(0xFF007BFF),
          // height: 30,
          padding: const EdgeInsets.fromLTRB(10, 30, 30, 20),
          child: Row
          (
            children: 
            [
              Expanded
              (
                flex: 5,
                child: Image.asset('assets/moi_logo_big.png',),
              ), // MOI Icon
              const Expanded
              (
                flex: 20,
                child: SearchBar()
              ), // Search bar
              Expanded
              (
                flex: 2,
                child: Padding
                (
                  padding: const EdgeInsets.all(0),
                  child: IconButton
                  (
                    onPressed: () {},
                    icon: const Icon(Icons.mic),
                    iconSize: 40,
                  ), // Speech recognition icon
                )
              )
            ],
          ),
        ),
    );
  }
}

class RewardBox extends StatelessWidget
{
  const RewardBox({super.key});
  @override
  Widget build(BuildContext context)
  {
    return Material
    (
      child: Container
      (
        width: 300,
        height: 100,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration
        (
          color: Color(0xFFFFFFFFF),
          borderRadius: BorderRadius.circular(0),
          boxShadow:
          [
            BoxShadow
            (
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Row
        (
          children: 
          [
            Container
            (
              color: Colors.red,
              child: const Expanded
              (
                // flex: 1,
                child: Text('Earn 50 points for renewing'),
              )
            )
          ],
        )
      ),
    );
  }
}

class MainBody extends StatelessWidget
{
  const MainBody({super.key});
  @override
  Widget build(BuildContext context)
  {
    return Material
    (
      child: Container
      (
        color: const Color(0xFFF2F2F2),
        alignment: Alignment.topCenter,
        child: const Column
        (
          children: 
          [
            Expanded
            (
              flex: 0,
              child: TopBar(),
            ),
            Expanded
            (
              flex: 0,
              child: TopBarMenu(),
            ),
            Expanded
            (
              flex: 0,
              child: RewardBox(),
            )
          ],
        )
      ),
    );
  }
}

class SearchBar extends StatelessWidget
{
  const SearchBar({super.key});
  @override
  Widget build(BuildContext context)
  {
    return Container
    (
      padding: const EdgeInsets.all(0),
      child: TextField
      (
        decoration: InputDecoration
        (
          contentPadding: const EdgeInsets.all(1),
          border: OutlineInputBorder
          (
            borderRadius: BorderRadius.circular(20.0),
          ),
          filled: true,
          fillColor: Color(0xFFFFFFFF),
          prefixIcon: const Icon(Icons.search),
        ),
      )
    );
  }
}
