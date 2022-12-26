import 'package:flutter/material.dart';
import 'package:imdb/main.dart';

class PaddedText extends StatelessWidget {
  final String text;

  PaddedText(this.text);

  @override
  Widget build(BuildContext contex) {
    return Padding(
        child: Text(this.text,style: TextStyle(color: iconBool? Colors.black : Colors.white),), 
        padding: EdgeInsets.only(top: 5, bottom: 5));
  }
}