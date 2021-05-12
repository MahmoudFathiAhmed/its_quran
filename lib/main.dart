import 'package:flutter/material.dart';
import 'package:its_quran/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF000E1F),
        accentColor: Color(0xFFFFC710),
      ),
      home: HomeScreen(),
    );
  }
}

