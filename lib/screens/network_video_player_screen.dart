import 'package:flutter/material.dart';
import '../widgets/video/network_video_player_widget.dart';

class NetworkVideoPlayerScreen extends StatelessWidget {
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
                child: Image.asset("Assets/Icons/back@2x.png"));
          }),
        ],
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            height: MediaQuery.of(context).size.height * .06,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/Icons/share@2x.png"),
              ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: TabBar(
        tabs: [
          Tab(
            icon: Image.asset(
              'Assets/Icons/tavideo@2x.png',
            ),
          ),
        ],
        isScrollable: true,
      ),
    );
  }
}
