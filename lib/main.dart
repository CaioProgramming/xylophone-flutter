import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Xylophone(),
        ),
      ),
    );
  }
}

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: makeNotes(7),
          )),
    );
  }

  void playnote(int note) {
    if (note == 0) {
      note += 1;
    }
    final player = AudioCache();
    player.play('note$note.wav');
  }

  makeNotes(int amount) {
    var buttons = <Widget>[];
    var colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.deepPurple
    ];
    for (int i = 0; i < amount; i++) {
      buttons.add(makeNote(i, colors[i]));
    }
    return buttons;
  }

  Widget makeNote(int index, MaterialColor color) =>
      Expanded(
          child: FlatButton(
            color: color,
            onPressed: () {
              playnote(index);
            },
          ));
}
