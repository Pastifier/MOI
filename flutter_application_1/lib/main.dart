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
    return const Material
    (
      child: Row
      (
        children:
        [
          Expanded
          (
            flex: 5,
            child:Center
            (
              child: Text('One'),
            ),
          ),
          Expanded
          (
            flex: 1,
            child: Center
            (
              child: Text('Two')
            ),
          ),
          Expanded
          (
            flex: 5,
            child: Center
            (
              child: Text('Three')
            ),
          ),
        ],
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
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Row
          (
            children: 
            [
              Expanded
              (
                flex: 3,
                child: Image.asset('assets/moi.png', height: 50,),
              ), // MOI Icon
              const Expanded
              (
                flex: 12,
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

class MainBody extends StatelessWidget
{
  const MainBody({super.key});
  @override
  Widget build(BuildContext context)
  {
    // return Material
    // (
    //   child: Container
    //   (
    //     color: const Color(0xFFF2F2F2),
    //     alignment: Alignment.topCenter,
    //     child: Container
    //     (
    //       color: const Color(0xFF007BFF),
    //       height: 120,
    //       padding: const EdgeInsets.all(10),
    //       child: Row
    //       (
    //         children: 
    //         [
    //           Expanded
    //           (
    //             flex: 1,
    //             child: Image.asset('assets/moi.png', height: 50,),
    //           ),
    //           const Expanded
    //           (
    //             flex: 4,
    //             child: SearchBar()
    //           ),
    //           Expanded
    //           (
    //             flex: 1,
    //             child: Padding
    //             (
    //               padding: const EdgeInsets.all(5),
    //               child: FloatingActionButton
    //               (
    //                 onPressed: () {},
    //               )
    //             )
    //           )
    //         ],
    //       ),
    //     ),
    //   )
    // );
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
              child: TopBar(),
              flex: 0,
            ),
            Expanded
            (
              flex: 0,
              child: TopBarMenu(),
            ),
          ],
        )
        // child: Container
        // (
        //   color: const Color(0xFF007BFF),
        //   height: 120,
        //   padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
        //   child: Row
        //   (
        //     children: 
        //     [
        //       Expanded
        //       (
        //         flex: 1,
        //         child: Image.asset('assets/moi.png', height: 50,),
        //       ), // MOI Icon
        //       const Expanded
        //       (
        //         flex: 6,
        //         child: SearchBar()
        //       ), // Search bar
        //       Expanded
        //       (
        //         flex: 1,
        //         child: Padding
        //         (
        //           padding: const EdgeInsets.all(0),
        //           child: IconButton
        //           (
        //             onPressed: () {},
        //             icon: const Icon(Icons.mic),
        //             iconSize: 35,
        //           ), // Speech recognition icon
        //         )
        //       )
        //     ],
        //   ),
        // ),
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
      padding: const EdgeInsets.all(16.0),
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

// class TestWidget extends StatelessWidget
// {
//   const TestWidget ({super.key});
//   Widget build(BuildContext context)
//   {
//     return Material
//     (
//       child: 
//     )
//   }
// }