import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _IntroScreenState(),
    );
  }
}

class _IntroScreenState extends StatefulWidget {
  const _IntroScreenState({super.key});

  @override
  State<_IntroScreenState> createState() => __IntroScreenStateState();
}

var myStyleFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(
        color: const Color.fromARGB(255, 251, 219, 122), fontSize: 30));

class __IntroScreenStateState extends State<_IntroScreenState> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 120),
              child: Container(
                child: Text('TIC TAC TOE', style: myStyleFont),
              ),
            )),
            Expanded(
              flex: 2,
              child: Container(
                child: AvatarGlow(
                  duration: Duration(seconds: 1),
                  glowColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[900],
                      child: Container(
                        child: Image.asset(
                          'images/tic.png',
                          color: Colors.white,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: Container(child: Text('Hale17OT', style: myStyleFont)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homePage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 60),
                child: ClipRect(
                  clipBehavior: Clip.hardEdge,
                  child: SizedBox(
                    width: 200, // Adjust the width to your desired size
                    height: 60, // Adjust the height to your desired size
                    child: Container(
                      padding: EdgeInsets.all(
                          10), // You can adjust the padding as needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            20), // Adjust the radius to your liking
                      ),
                      child: Center(
                        child: Text(
                          'Play Game',
                          style: myStyleFont,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
