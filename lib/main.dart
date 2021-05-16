import 'package:flutter/material.dart';
import 'package:its_quran/screens/home_screen.dart';
import 'package:its_quran/screens/network_video_player_screen.dart';
import './widgets/video/network_video_player_widget.dart';

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
      routes: {
        'test': (context) {
          return NetworkVideoPlayerScreen();
        }
      },
    );
  }
}
