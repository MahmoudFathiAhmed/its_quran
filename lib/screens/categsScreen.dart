import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:its_quran/Provider/home_provider.dart';
import 'package:its_quran/screens/templateScreen.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:its_quran/widgets/searchButton.dart';
import 'package:provider/provider.dart';

import 'fullCategScreen.dart';

class CategsScreen extends StatelessWidget {
  List<Map<String, dynamic>> categs = [
    {
      "title": "الكل",
      "caption": "شاهد كل الأقسام",
      "img": "assets/3.0x/allsm.png",
      "type":ItemType.video,
    },
    {
      "title": "مناشط الشيخ",
      "caption": "جميع مناشط الشيخ المضافة",
      "img": "assets/3.0x/fullsh.png",
      "type":ItemType.video,
    },
    {
      "title": "فيديوهات",
      "caption": "جميع المقاطع المرئية",
      "img": "assets/2.0x/videos.png",
      "type":ItemType.video,
    },
    {
      "title": "الكتب",
      "caption": "جميع الكتب والمراجع",
      "img": "assets/3.0x/booksm.png",
      "type":ItemType.book,
    },
    {
      "title": "الصوتيات",
      "caption": "جميع المقاطع الصوتية",
      "img": "assets/3.0x/tasoundact.png",
      "type":ItemType.audio,
    },
    // {
    //   "title": "المقالات",
    //   "caption": "جميع المقالات المضافة",
    //   "img": "assets/3.0x/taartact.png",
    //   "type":ItemType.article,
    // },
  ];
  static String routeName = '/categsScreen';
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      title: "الأقسام",
      actions: [SearchButon()],
      body: Container(
        child: Center(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 5,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 1,
              maxCrossAxisExtent: 250.0,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Provider.of<HomeProvider>(context,listen: false).changeAuthor(author: "");
                  Navigator.of(context).pushNamed(FullCategScreen.routeName,arguments:categs[index],);

                },

                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        categs[index]['img'],
                        // color: Theme.of(context).accentColor,
                        scale: index == 1 ? 2.9 : 1.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        categs[index]['title'],
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        categs[index]['caption'],
                        style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
