import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piano',
      home: PianoApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PianoApp extends StatelessWidget {
  void playSound(int solfege) {
    final player = AudioCache();
    player.play('note$solfege.wav');
  }

  Container pianoKey({Color color, int solfege}) {
    return Container(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(solfege);
        },
        child: null,
      ),
      height: 200.0,
      width: 55.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '7 Solfege Electronic Piano',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                pianoKey(color: Colors.red, solfege: 1),
                pianoKey(color: Colors.orange, solfege: 2),
                pianoKey(color: Colors.yellow, solfege: 3),
                pianoKey(color: Colors.green, solfege: 4),
                pianoKey(color: Colors.lightBlue, solfege: 5),
                pianoKey(color: Colors.blue, solfege: 6),
                pianoKey(color: Colors.purple, solfege: 7),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
