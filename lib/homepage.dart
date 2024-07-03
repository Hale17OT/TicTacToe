import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<String> displayExoh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  static var myStyleFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(
          color: const Color.fromARGB(255, 251, 219, 122), fontSize: 30));
  static var myStyleFont2 = GoogleFonts.pressStart2p(
      textStyle: TextStyle(
          color: const Color.fromARGB(255, 251, 219, 122), fontSize: 16));
  int filledBoxes = 0;
  int xScore = 0;
  int oScore = 0;
  var myStyle = TextStyle(color: Colors.white, fontSize: 30);
  bool OhTurn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 97, 97),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player O',
                        style: myStyleFont2,
                      ),
                      Text(
                        oScore.toString(),
                        style: myStyleFont2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player X',
                        style: myStyleFont2,
                      ),
                      Text(
                        xScore.toString(),
                        style: myStyleFont2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color.fromARGB(255, 0, 0, 0))),
                      child: Center(
                        child: Text(
                          displayExoh[index],
                          style: myStyle,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Container(
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'By Hale17OT',
                style: myStyleFont,
              )
            ],
          ))),
        ],
      ),
    );
  }

  // void _tapped(int index) {
  //   setState(() {
  //     if (OhTurn && displayExoh[index] == '') {
  //       displayExoh[index] = 'O';
  //     } else if (!OhTurn && displayExoh[index] == '') {
  //       displayExoh[index] = 'x';
  //     }

  //     OhTurn = !OhTurn;
  //     _checkwinner();
  //   });
  // }

  void _tapped(int index) {
    setState(() {
      if (displayExoh[index] == '') {
        if (OhTurn) {
          displayExoh[index] = 'O';
          filledBoxes += 1;
        } else {
          displayExoh[index] = 'X';
          filledBoxes += 1;
        }

        OhTurn = !OhTurn;
        _checkwinner();
      }
    });
  }

  void _checkwinner() {
    // checks first row

    if (displayExoh[0] == displayExoh[1] &&
        displayExoh[0] == displayExoh[2] &&
        displayExoh[0] != '') {
      _showWindialogue(displayExoh[0]);
    }

    //check middle axis 2

    if (displayExoh[2] == displayExoh[4] &&
        displayExoh[2] == displayExoh[6] &&
        displayExoh[2] != '') {
      _showWindialogue(displayExoh[2]);
    }

    // checks second row

    if (displayExoh[3] == displayExoh[4] &&
        displayExoh[3] == displayExoh[5] &&
        displayExoh[3] != '') {
      _showWindialogue(displayExoh[3]);
    }

    //checks third row

    if (displayExoh[6] == displayExoh[7] &&
        displayExoh[6] == displayExoh[8] &&
        displayExoh[6] != '') {
      _showWindialogue(displayExoh[6]);
    }

    //checks first column

    if (displayExoh[0] == displayExoh[3] &&
        displayExoh[0] == displayExoh[6] &&
        displayExoh[0] != '') {
      _showWindialogue(displayExoh[0]);
    }

    // checks second column

    if (displayExoh[1] == displayExoh[4] &&
        displayExoh[1] == displayExoh[7] &&
        displayExoh[1] != '') {
      _showWindialogue(displayExoh[1]);
    }

    //checks third column

    if (displayExoh[2] == displayExoh[5] &&
        displayExoh[2] == displayExoh[8] &&
        displayExoh[2] != '') {
      _showWindialogue(displayExoh[2]);
    }

    //checks middle axis

    if (displayExoh[0] == displayExoh[4] &&
        displayExoh[0] == displayExoh[8] &&
        displayExoh[0] != '') {
      _showWindialogue(displayExoh[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialogue();
    }
  }

  void _showDrawDialogue() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Draw'),
            actions: [
              FloatingActionButton(
                onPressed: () {
                  _clearboard();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Play Agian',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          );
        });
  }

  void _showWindialogue(String winner) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Winner is: ' + winner),
            actions: [
              FloatingActionButton(
                onPressed: () {
                  _clearboard();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Play Agian',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          );
        });

    if (winner == 'O') {
      oScore += 1;
    } else if (winner == 'X') {
      xScore += 1;
    }
  }

  void _clearboard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExoh[i] = '';
      }
    });
    filledBoxes = 0;
  }
}
