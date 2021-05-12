import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        flexibleSpace: Container(
          height: MediaQuery.of(context).size.height*0.1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/Icons/logo.png"),
            ),
          ),
        ),
      ),
    );
  }
}
