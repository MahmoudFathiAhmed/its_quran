import 'package:flutter/material.dart';

import 'package:its_quran/services/get_api_data.dart';

import 'package:its_quran/widgets/CategoryHeaderRow.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:its_quran/widgets/appDrawer.dart';
import 'package:its_quran/widgets/noInternetConnectionWidget.dart';
import 'package:its_quran/widgets/searchButton.dart';
import 'package:its_quran/widgets/shimmer_loader.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GetAPIData apiData = GetAPIData();

  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [SearchButon()],
        leading: Builder(
          builder: (context) => Tooltip(
            message: 'قائمة التنقل',
            child: InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
                print('drawer clicked');
              },
              child: Image.asset("assets/menu.png"),
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
                  scale: 2,
                  image: AssetImage("assets/logo.png"),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {});
          return Future<void>.value();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5.0),
            child: Container(
              child: Column(
                children: [
                  FutureBuilder(
                    future: apiData.getData(
                        pageNumber: "1",
                        perPage: "10",
                        author: "",
                        type: "videos"),
                    builder: (c, snapShot) {
                      if (snapShot.connectionState == ConnectionState.waiting) {
                        return ShimmerLoader();
                      } else if (snapShot.connectionState ==
                              ConnectionState.done &&
                          snapShot.data == null) {
                        return Container(
                          height: 0,
                        );
                      } else {
                        return HomeScreenSection(
                          list: snapShot.data,
                          itemType: ItemType.video,
                          categoryHeaderRow: CategoryHeaderRow(
                            type: ItemType.video,
                            title: 'فيديوهات',
                            caption: 'جميع المحاضرات المرتبة',
                          ),
                        );
                      }
                    },
                  ),
                  FutureBuilder(
                    future: apiData.getData(
                        pageNumber: "2",
                        perPage: "10",
                        author: "1",
                        type: "audios"),
                    builder: (c, snapshot2) {
                      if (snapshot2.connectionState ==
                          ConnectionState.waiting) {
                        return ShimmerLoader();
                      } else if (snapshot2.connectionState ==
                              ConnectionState.done &&
                          snapshot2.data == null) {
                        return RefreshIndicator(
                          onRefresh: () {
                            print('refreshed!');
                            setState(() {});
                            return Future<void>.value();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                NoInternetConnectionWidget(),
                                SizedBox(
                                  height: 70.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return HomeScreenSection(
                          list: snapshot2.data,
                          itemType: ItemType.audio,
                          categoryHeaderRow: CategoryHeaderRow(
                            type: ItemType.audio,
                            title: 'الصوتيات',
                            caption: 'جميع المقاطع الصوتية',
                          ),
                        );
                      }
                    },
                  ),
                  FutureBuilder(
                    future: apiData.getData(
                        pageNumber: "1",
                        perPage: "10",
                        author: "",
                        type: "books"),
                    builder: (c, snapshot3) {
                      if (snapshot3.connectionState ==
                          ConnectionState.waiting) {
                        return ShimmerLoader();
                      } else if (snapshot3.connectionState ==
                              ConnectionState.done &&
                          snapshot3.data == null) {
                        return Container(
                          height: 0,
                        );
                      } else {
                        return HomeScreenSection(
                          list: snapshot3.data,
                          itemType: ItemType.book,
                          categoryHeaderRow: CategoryHeaderRow(
                            type: ItemType.book,
                            title: 'الكتب',
                            caption: 'الكتب المضافة مؤخراً',
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
