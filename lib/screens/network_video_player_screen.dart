import 'package:flutter/material.dart';
import '../widgets/video/network_video_player_widget.dart';

class NetworkVideoPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Builder(builder: (context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: Image.asset(
                  "Assets/Icons/back.png",
                ),
              );
            }),
          ],
          leading: GestureDetector(
            onTap: () {},
            child: Container(
              height: MediaQuery.of(context).size.height * .06,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/Icons/share.png"),
                ),
              ),
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Image.asset(
                  'Assets/Icons/tavideo.png',
                ),
              ),
            ],
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            NetworkVideoPlayerWidget(),
          ],
        ),
      ),
    );
  }
}
