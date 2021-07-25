import 'package:flutter/material.dart';


import 'package:its_quran/services/get_api_data.dart';


import 'package:its_quran/widgets/CategoryHeaderRow.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:its_quran/widgets/appDrawer.dart';
import 'package:its_quran/widgets/searchButton.dart';




class HomeScreen extends StatelessWidget {

final GetAPIData apiData=GetAPIData();

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5.0),
        child: Container(
          child: Column(
            children: [
//               FutureBuilder(
//                future:articles.getData( pageNumber:"2", perPage: "30", author: "1") ,
//                 builder: (c,snapshot){
//                  if(!snapshot.hasData){return Center(child: CircularProgressIndicator(color: Colors.yellow,));}
//                  else
//                  return HomeScreenSection(
// list: snapshot.data,
//                    itemType: ItemType.article,
//                    categoryHeaderRow: CategoryHeaderRow(
//
//                      title: 'مناشط الشيخ',
//                      caption: 'جميع مناشط الشيخ المضافة',
//                    ),
//                  );
//                 },
//               ),
              FutureBuilder(
                future:
                    apiData.getData(pageNumber: "1", perPage: "10", author: "",type: "videos"),
                builder: (c, snapShot) {
                  if (!snapShot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.yellow,
                      //
                    ));
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
                future:
                apiData.getData(pageNumber: "1", perPage: "10", author: "",type: "audios"),
                builder: (c, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.yellow,
                      //
                    ));
                  } else {
                    // print(snapshot.data[0]);

                    return HomeScreenSection(
                      list: snapshot.data,
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
                future:
                apiData.getData(pageNumber: "1", perPage: "10", author: "",type: "books"),
                builder: (c, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.yellow,
                      //
                    ));
                  } else {
                    return HomeScreenSection(
                      list: snapshot.data,
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

              // FutureBuilder(
              //   future: apiData.getData(
              //       pageNumber: "2", perPage: "10", author: "1",type: "articles"),
              //   builder: (c, snapshot) {
              //     if (!snapshot.hasData) {
              //       return Center(
              //         child: CircularProgressIndicator(
              //           color: Colors.yellow,
              //         ),
              //       );
              //     } else {
              //       return HomeScreenSection(
              //         list: snapshot.data,
              //         categoryHeaderRow: CategoryHeaderRow(
              //
              //           type: ItemType.article,
              //           title: 'المقالات',
              //           caption: 'جميع المقالات المضافة',
              //         ),
              //       );
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
