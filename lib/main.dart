import 'package:animation_2/screens/first_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.teal ) ,
    home: const FirstScreen()
  ));
}


