import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

// Navigation.
Widget currScreen = const HomeScreen();

void _navigateToSelectedScreenOnTap(
    BuildContext context, Widget selectedScreen) {
  if (ttsState == false) {
    Navigator.of(context)
        .pop(MaterialPageRoute(builder: (context) => currScreen));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => selectedScreen));
    currScreen = selectedScreen;
  }
}

void _navigateToSelectedScreen(BuildContext context, Widget selectedScreen) {
  Navigator.of(context)
      .pop(MaterialPageRoute(builder: (context) => currScreen));
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => selectedScreen));
  currScreen = selectedScreen;
}

// Points system.
DateTime issuanceTime = DateTime.now();
int totalPoints = 0;

void _recordIssuanceTime() {
  issuanceTime = DateTime.now();
}

int updatePoints(Duration timeTaken) {
  int points = 0;

  if (timeTaken.inSeconds <= 5) {
    points = 100;
  } else if (timeTaken.inSeconds <= 15) {
    points = 50;
  }
  return points;
}

Duration calculateTimeTaken(DateTime issuanceTime, DateTime paymentTime) {
  return paymentTime.difference(issuanceTime);
}

// Text-to-speech
bool ttsState = false;

final FlutterTts flutterTts = FlutterTts();
Future<void> _speak(String text) async {
  if (ttsState) {
    await flutterTts.setLanguage("en-US");
    await flutterTts.speak(text);
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MOI Hackathon App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        flexibleSpace: Container(
          height: 85,
          color: const Color(0xFF007BFF),
          child: Row(children: [
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    _speak('Ministry of Interior Logo');
                  },
                  child: Image.asset('assets/moi_logo_big.png'),
                )),
            Expanded(
              flex: 4,
              child: GestureDetector(
                  onTap: () {
                    _speak('Search bar');
                  },
                  child: const SearchBar()),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                // TTS Toggle Button
                icon: Icon(ttsState ? Icons.volume_up : Icons.volume_off),
                onPressed: () {
                  _speak('Text to speech turned off');
                  setState(() {
                    ttsState = !ttsState; // Toggle the TTS state
                    _speak('Text to speech turned on');
                  });
                },
              ),
            )
          ]),
        ),
      ),
      body: const MainBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Media'),
          BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner_sharp), label: 'Files'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_mark), label: 'Help'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          String label = '';
          switch (index) {
            case 0:
              label = 'Home';
              break;
            case 1:
              label = 'Media';
              break;
            case 2:
              label = 'Documents';
              break;
            case 3:
              label = 'Help';
              break;
            case 4:
              label = 'Profile';
              break;
          }
          _speak(label);
        },
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: const Color(0xFFF2F2F2),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
                child: TopBarMenu(),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                      width: 200,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xff4e00b5),
                      ),
                      child: Center(
                          child: Text(
                        'MOI Reward Points: $totalPoints',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      )))),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: ServiceCards(),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: RewardBox(),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: FinePayment(),
              )
            ],
          )),
    );
  }
}

class TopBarMenu extends StatelessWidget {
  const TopBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            color: const Color(0xFF007BFF),
            height: 25,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                      child: ElevatedButton(
                    onPressed: () {
                      _speak('Services');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        )),
                    child: const Text(
                      'Services',
                      style: TextStyle(color: Color(0xFF82BFFF)),
                    ),
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                      child: ElevatedButton(
                    onPressed: () {
                      _speak('Top Used');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF82BFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        )),
                    child: const Text(
                      'Top Used',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                      child: ElevatedButton(
                    onPressed: () {
                      _speak('Rewards');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF82BFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        )),
                    child: const Text(
                      'Rewards',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                ),
              ],
            )));
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color(0xFF007BFF),
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset('assets/moi_logo_big.png', height: 65),
            ), // MOI Icon
            const Expanded(flex: 3, child: SearchBar()), // Search bar
            Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mic),
                      iconSize: 40,
                    ),
                  ), // Speech recognition icon
                ))
          ],
        ),
      ),
    );
  }
}

class RewardBox extends StatelessWidget {
  const RewardBox({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: 350,
          height: 85,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Row(
            children: [
              // Container(
              Expanded(
                flex: 1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => _speak(
                            'Earn 50 points for renewing. Issuance of a Vehicle Registration card'),
                        child: const Text('Earn 50 points for renewing',
                            style: TextStyle(color: Color(0xFF007BFF))),
                      ),
                      InkWell(
                        onTap: () => _speak(
                            'Earn 50 points for renewing. Issuance of a Vehicle Registration card'),
                        child: const Text(
                            'Issuance of a Vehicle Registration card'),
                      ),
                    ]),
                // )),
              ),
              ElevatedButton(
                onPressed: () {
                  _speak('View more');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007BFF),
                ),
                child: const Text('View more',
                    style: TextStyle(color: Color(0xFFFFFFFF))),
              )
            ],
          )),
    );
  }
}

class FinePayment extends StatelessWidget {
  const FinePayment({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: 350,
          height: 105,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => _speak(
                            'Earn 100 points for resolving your latest traffic fine. 2 days left to claim this reward'),
                        child: const Text(
                            'Earn 100 points for resolving your latest traffic fine',
                            style: TextStyle(color: Color(0xFF007BFF))),
                      ),
                      InkWell(
                        onTap: () => _speak(
                            'Earn 100 points for resolving your latest traffic fine. 2 days left to claim this reward'),
                        child: const Text(
                          '2 days left to claim this reward',
                          style: TextStyle(color: Color(0xff740a0a)),
                        ),
                      ),
                    ]),
              ),
              ElevatedButton(
                onLongPress: () {
                  _navigateToSelectedScreen(context, const Fines());
                },
                onPressed: () {
                  _speak('Pay Fine');
                  _navigateToSelectedScreenOnTap(context, const Fines());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007BFF),
                ),
                child: const Text('Pay Fine',
                    style: TextStyle(color: Color(0xFFFFFFFF))),
              )
            ],
          )),
    );
  }
}

class ServiceCards extends StatelessWidget {
  const ServiceCards({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      // child: Padding(
      // padding: EdgeInsets.all(10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onLongPress: () {
                _navigateToSelectedScreen(context, const Fines());
              },
              onPressed: () {
                _speak('Traffic');
                // _navigateToSelectedScreen(context, Fines());
                _navigateToSelectedScreenOnTap(context, const Fines());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF2F2F2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  )),
              child: const Column(children: [
                Icon(
                  Icons.traffic,
                ),
                Text('Traffic')
              ]),
            ),
            ElevatedButton(
              onPressed: () {
                _speak('Police');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF2F2F2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  )),
              child: const Column(children: [
                Icon(
                  Icons.local_police_sharp,
                ),
                Text('Police')
              ]),
            ),
            ElevatedButton(
              onPressed: () {
                _speak('Civil');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF2F2F2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  )),
              child: const Column(children: [
                Icon(
                  Icons.crisis_alert,
                ),
                Text('Civil')
              ]),
            ),
            ElevatedButton(
              onPressed: () {
                _speak('General');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF2F2F2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  )),
              child: const Column(children: [
                Icon(
                  Icons.card_membership,
                ),
                Text('General')
              ]),
            ),
          ]),
    );
  }
}

class Fines extends StatelessWidget {
  const Fines({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF007BFF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            _navigateToSelectedScreen(context, const HomeScreen());
          },
        ),
        title: const Text('Traffic Fines Payment'),
      ),
      body: const Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: FinesList()),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Media'),
          BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner_sharp), label: 'Files'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_mark), label: 'Help'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          String label = '';
          switch (index) {
            case 0:
              label = 'Home';
              break;
            case 1:
              label = 'Media';
              break;
            case 2:
              label = 'Documents';
              break;
            case 3:
              label = 'Help';
              break;
            case 4:
              label = 'Profile';
              break;
          }
          _speak(label);
        },
      ),
    );
  }
}

class FinesList extends StatefulWidget {
  const FinesList({super.key});
  @override
  FinesListState createState() => FinesListState();
}

class FinesListState extends State<FinesList> {
  List items = [];
  DateTime dateNow = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFF2F2F2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          )
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('File no: XXXXXXXXXXX'),
                          const Text('Issuance Date: '),
                          ElevatedButton(
                            onPressed: () {
                              totalPoints += updatePoints(calculateTimeTaken(
                                  issuanceTime, DateTime.now()));
                              // print(totalPoints);
                            },
                            child: const Text('Pay now'),
                          )
                        ])
                    // child: Text('Test List item'),
                    ));
          },
          separatorBuilder: (context, index) {
            return Container(height: 50);
          }),
      floatingActionButton: FloatingActionButton(
        child: const Text('(DEMO) Add fine'),
        onPressed: () {
          setState(() {
            if (items.isNotEmpty) {
              items.removeLast();
            } else {
              items.add('Test item');
              _recordIssuanceTime();
            }
          });
        },
      ),
    );
  }
}
