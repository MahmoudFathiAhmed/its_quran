import 'package:flutter/material.dart';
import 'package:its_quran/widgets/PDFContent.dart';
import 'package:its_quran/widgets/YoutubeVideoPlayer.dart';
import 'package:its_quran/widgets/audioPlayer.dart';
import 'package:its_quran/widgets/soundCloudTabWidget.dart';
import '../widgets/back_arrow.dart';
import '../widgets/video/network_video_player_widget.dart';
import 'attachmentsAll.dart';

class NetworkVideoPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
                onTap: () {}, child: Image.asset('assets/share.png')),
          ],
          leading: BackArrow(),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Image.asset(
                  'assets/tavideo.png',
                ),
              ),
              Tab(
                icon: Image.asset(
                  'assets/tasoundact.png',
                ),
              ),
              Tab(
                icon: Image.asset(
                  'assets/tacloudact.png',
                ),
              ),
              Tab(
                icon: Image.asset(
                  'assets/taartact.png',
                ),
              ),
            ],
            isScrollable: false,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  VideoPlayerWidget(), // NetworkVideoPlayerWidget(),
                  AudioPlayerWidget(),
                  SoundCloudTab(),
                  PDFContent(),
                ],
              ),
            ),
            Card(
              elevation: 10.0,
              child: ListTile(
                title: Hero(
                  tag: 'attachments',
                  child: Text(
                    'المرفقات',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                leading: Image.asset('assets/attach.png'),
                trailing: Image.asset('assets/leftarr.png'),
                onTap: () => Navigator.of(context)
                    .pushNamed(AttachmentsScreen.routeName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
