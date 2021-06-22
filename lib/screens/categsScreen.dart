import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:its_quran/screens/templateScreen.dart';
import 'package:its_quran/widgets/searchButton.dart';

import 'fullCategScreen.dart';

class CategsScreen extends StatelessWidget {
  List<Map<String, String>> categs = [
    {
      "title": "الكل",
      "caption": "شاهد كل الأقسام",
      "img": "assets/3.0x/allsm.png",
    },
    {
      "title": "مناشط الشيخ",
      "caption": "جميع مناشط الشيخ المضافة",
      "img": "assets/3.0x/fullsh.png",
    },
    {
      "title": "فيديوهات",
      "caption": "جميع المقاطع المرئية",
      "img": "assets/2.0x/videos.png",
    },
    {
      "title": "الكتب",
      "caption": "جميع الكتب والمراجع",
      "img": "assets/3.0x/booksm.png",
    },
    {
      "title": "الصوتبات",
      "caption": "جميع المقاطع الصوتية",
      "img": "assets/3.0x/tasoundact.png",
    },
    {
      "title": "المقالات",
      "caption": "جميع المقالات المضافة",
      "img": "assets/3.0x/taartact.png",
    },
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
            itemCount: 6,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 1,
              maxCrossAxisExtent: 250.0,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(FullCategScreen.routeName),
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
