import 'package:flutter/material.dart';
import "package:english_words/english_words.dart";
import "keypad.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Keypad()
        ),
    );
  }
}





class RandomWord extends StatefulWidget{

  @override
  RandomWordState createState(){
    return RandomWordState();
  }

}

class RandomWordState extends State<RandomWord>{
    var wordPair = WordPair.random();

    void pressed(){
      setState(() {
        wordPair = WordPair.random();
      });
    }

    @override
    Widget build(BuildContext buildContext){

      return Container(
        child: Column(
          children: 
          [
            Text(wordPair.asPascalCase),
            RaisedButton(
              child: Text("Add"),
              onPressed: pressed)
          
          ],),
      );
    }
}

