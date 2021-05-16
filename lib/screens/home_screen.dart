import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Builder(builder: (context) {
            return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: Image.asset("Assets/Icons/menu.png"));
          }),
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('test');
          },
          child: Container(
            height: MediaQuery.of(context).size.height * .06,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/Icons/search.png"),
              ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .06,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/Icons/logo.png"),
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(),
    );
  }
}
