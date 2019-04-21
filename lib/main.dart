import 'package:flutter/material.dart';
import 'functions.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Merriweather'),
      title: 'Currency Calculator',
      home:MainScreen(),
    );
  }
}
