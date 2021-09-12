import 'package:flutter/material.dart';
import 'package:its_quran/widgets/audioPlayer.dart';
import 'package:its_quran/widgets/soundCloudTabWidget.dart';
import 'package:its_quran/widgets/video/youtube_player.dart';
import '../widgets/back_arrow.dart';
import 'attachmentsAll.dart';
import 'package:share/share.dart';

class NetworkVideoPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> passedArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    String link = passedArgs["link"];
    String pageTitle = passedArgs["title"] ?? '';
    String attachments = passedArgs["attachments"];
    int tabIndex = passedArgs["tabIndex"];

    print("TabBarView Mediasalemlink is  link :$link");
    //Navigator.pop(context);
    return DefaultTabController(
      length: 1,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            pageTitle,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w200,
            ),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () async {
                String shareText = attachments != null
                    ? "تابع درس  \"$pageTitle\" \n$link" +
                        "\nويمكنك تحميل ملف الدرس من هنا👇\n$attachments" +
                        "\n-تطبيق إنه القرءان-"
                    : "تابع درس  \"$pageTitle\" \n$link" +
                        "\n-تطبيق إنه القرءان-";
                await Share.share(shareText);
              },
              child: Image.asset('assets/share.png'),
            ),
          ],
          leading: BackArrow(),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Image.asset(
                  tabIndex == 0 ? 'assets/videos.png' : 'assets/tacloudact.png',
                  scale: tabIndex == 0 ? 2.0 : 1,
                ),
              ),
              // Tab(
              //   icon: Image.asset(
              //     'assets/tasoundact.png',
              //   ),
              // ),
              // Tab(
              //   icon: Image.asset(
              //     'assets/tacloudact.png',
              //   ),
              //),
              // Tab(
              //   icon: Image.asset(
              //     'assets/taartact.png',
              //   ),
              // ),
            ],
            isScrollable: false,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  tabIndex == 0
                      ? YoutubeSalem(link,attachments)
                      : SoundCloudTab(link: link),
                  // AudioPlayerWidget(),
                  //SoundCloudTab(link: link),
                  //PDFContent(),
                ],
              ),
            ),
            attachments != null
                ? Card(
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
                      onTap: () => Navigator.of(context).pushNamed(
                        AttachmentsScreen.routeName,
                        arguments: {"atts": attachments},
                        // add attachment type recognition and push it to attachments screen
                      ),
                    ))
                : Container(height: 0),
          ],
        ),
      ),
    );
  }
}
