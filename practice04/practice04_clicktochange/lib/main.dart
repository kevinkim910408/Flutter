import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text(
            'A L B U M ',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
            ),
          ),
        ),
        body: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var leftPic = 1;
  var rightPic = 2;

  void changePics() {
    leftPic = Random().nextInt(7) + 1;
    rightPic = Random().nextInt(7) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Image.asset('images/eunji_$leftPic.jpg',
                  width: 200.0, height: 400.0, fit: BoxFit.fill),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              child: Image.asset('images/eunji_$rightPic.jpg',
                  width: 200.0, height: 400.0, fit: BoxFit.fill),
            ),
          ],
        ),
        SizedBox(
          height: 50.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.white,
              onPressed: () {
                setState(() {
                  changePics();
                });
              },
              child: Text(
                'Click Me',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
