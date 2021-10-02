import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Game _game;
  final _controller = TextEditingController();
  String? _guessNumber;
  String? _feedback;
  bool _start = false;
  bool _end = false;

  @override
  void initState() {
    super.initState();
    _game = Game();
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GUESS THE NUMBER',
        ),
      ),
      body: Container(
        color: Colors.yellow.shade100,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                _buildHeader(),
                _buildMainContent(),
                _buildInputPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo_number.png',
          width: 240.0, // 160 = 1 inch
        ),
        Text(
          'GUESS THE NUMBER',
          style: GoogleFonts.kanit(fontSize: 22.0, color: Colors.blueAccent),
        ),
      ],
    );
  }

  Widget _buildMainContent() {

    if (_start) {
      return  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _guessNumber!,
                  style: GoogleFonts.kanit(fontSize: 80.0),
                ),
                  !_end
                   ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        _feedback!,
                        style: GoogleFonts.kanit(fontSize: 50.0),
                      ),
                    ],
                 )
              : Column(
         children: [

                SizedBox.shrink(),
                TextButton(
                    onPressed: () {
                      _game = Game();
                    },
                    child: Text(
                      'NEW GAME',
                      style: GoogleFonts.kanit(
                          fontSize: 22.0, color: Colors.blueAccent),
                    ))
    ],
    ),

            ],
            );
    } else {
      return Container(
        child: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Im thinking of a number between 1 and 100.\n',
                style:  GoogleFonts.kanit(fontSize: 22.0),
              ),
              Text(
                'Can you guess it? ',
                style:  GoogleFonts.kanit(fontSize: 22.0),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildInputPanel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          cursorColor: Colors.yellow,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            isDense: true,
            // กำหนดลักษณะเส้น border ของ TextField ในสถานะปกติ
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pink.withOpacity(0.5),
              ),
            ),
            // กำหนดลักษณะเส้น border ของ TextField เมื่อได้รับโฟกัส
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
            hintText: 'Enter the number here',
            hintStyle: TextStyle(
              color: Colors.pink.withOpacity(0.5),
              fontSize: 16.0,
            ),
          ),
        )),
        TextButton(
          onPressed: () {
            setState(() {
              _start = true;
              _guessNumber = _controller.text;
              int? guess = int.tryParse(_guessNumber!);
              if (guess != null) {
                var result = _game.doGuess(guess);
                if (result == 0) {
                  // ทายถูก
                  _feedback = 'CONRRECT!';

                } else if (result == 1) {
                  //มากไป
                  _feedback = 'TOO HIGH!';
               } else {
                  //น้อยไป
                  _feedback = 'TOO LOW!';
                }
              }
              _controller.clear();
            });
          },
          child: Text('GUESS'),
        ),
      ],
    );
  }
}
