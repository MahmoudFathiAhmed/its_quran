import 'dart:io';

import 'package:flutter/material.dart';
import 'package:its_quran/Provider/home_provider.dart';
import 'package:its_quran/services/get_api_data.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:its_quran/widgets/mainListItem.dart';
import 'package:provider/provider.dart';

import 'noInternetConnectionWidget.dart';

class SheikhScreenTabContent extends StatelessWidget {
  final ItemType itemsType;
  final GetAPIData apiData = GetAPIData();

  SheikhScreenTabContent({this.itemsType = ItemType.article});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: apiData.getData(
            type: strType(itemsType),
            pageNumber: "1",
            perPage: "30",
            author: Provider.of<HomeProvider>(context).author),
        builder: (c, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == null) {
            return NoInternetConnectionWidget();
          } else {
            List list = snapshot.data;
            print(
                "SheikhScreenContent of type $itemsType with length= [${list.length}]");
            return list.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.grid_view,
                          size: 90,
                          color: Theme.of(context).accentColor.withOpacity(0.5),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'لا يوجد عناصر لعرضها في الوقت الحالي',
                          style: TextStyle(fontWeight: FontWeight.w200),
                          softWrap: true,
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 5,
                    ),
                    itemCount: list.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 146 / 170,
                      maxCrossAxisExtent: 250.0,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return mainListItem(
                          itemType: itemsType, list: list)[index];
                    },

                    // childAspectRatio: 146 / 146,
                    // shrinkWrap: true,
                    // mainAxisSpacing: 5,
                    // crossAxisSpacing: 5,
                    //crossAxisCount: 2,
                    //scrollDirection: Axis.vertical,
                    //children: mainListItem(type: itemsType, list: list),
                  );
          }
        },
      ),
    );
    // return GridView.builder(
    //     shrinkWrap: true,
    //     itemCount: 10,
    //     physics: BouncingScrollPhysics(),
    //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //       childAspectRatio: 1,
    //       maxCrossAxisExtent: 250.0,
    //       crossAxisSpacing: 5.0,
    //       mainAxisSpacing: 5.0,
    //     ),
    //     itemBuilder: (context, index) {
    //       return MainListItem(
    //         itemType: itemsType,
    //       );
    //     });
  }

  String strType(ItemType type) {
    String str;
    switch (type) {
      case ItemType.video:
        {
          str = "videos";
        }
        break;
      case ItemType.book:
        {
          str = "books";
        }
        break;
      case ItemType.article:
        {
          str = "articles";
        }
        break;
      case ItemType.audio:
        {
          str = "audios";
        }
        break;
    }
    return str;
  }

  List<Widget> mainListItem(
      {@required ItemType itemType, @required List list}) {
    List<Widget> widgetList = [];
    int index = 0;
    list.forEach((element) {
      if (element != null) {
        String link = element[strType(itemType)]["data"]["link"] != null
            ? element[strType(itemType)]["data"]["link"]
            : element[strType(itemType)]["data"]["embed_code"] != null
                ? extractLink(
                    source: element[strType(itemType)]["data"]["embed_code"]
                        .toString())
                : null;

        if (element[strType(itemType)]["data"]["attachments"] != null) {
          widgetList.add (MainListItem(
            itemType: itemType,
            title: element["title"],
            link: element[strType(itemType)]["data"]["attachments"],
            imgUrl: element["medium_thumbnail"],
            attachments: element[strType(itemType)]["data"]["attachments"],
          ));
        } else if (element["books"] != null) {
          widgetList.add(MainListItem(
            itemType: itemType,
            title: element["title"],
            link: link,
            imgUrl: element["medium_thumbnail"],
            attachments: element["books"]["data"]["attachments"],
          ));
        } else if (element["audios"] != null) {
          widgetList.add(MainListItem(
            itemType: itemType,
            title: element["title"],
            link: element[strType(itemType)]["data"]["link"],
            imgUrl: element["medium_thumbnail"],
            attachments: element["audios"]["data"]["attachments"],
          ));
        } else {
          return Container(
            color: Colors.red,
            height: 100.0,
            width: 100.0,
          );

          ///This is the previous []handler]
          // if (element[strType(type)]["data"]["link"] != null) {
          //   widgetList.add(MainListItem(
          //     itemType: type,
          //     title: element["title"],
          //     link: element[strType(type)]["data"]["link"],
          //     imgUrl: element["medium_thumbnail"],
          //   ));
          // } else if (element[strType(type)]["data"]["attachments"] != null) {
          //   widgetList.add(MainListItem(
          //     itemType: type,
          //     title: element["title"],
          //     link: element[strType(type)]["data"]["attachments"],
          //     imgUrl: element["medium_thumbnail"],
          //   ));
          // } else if (element[strType(type)]["data"]["embed_code"] != null) {
          //   widgetList.add(MainListItem(
          //     itemType: type,
          //     title: element["title"],
          //     link: extractLink(
          //         source:
          //             element[strType(type)]["data"]["embed_code"].toString()),
          //     imgUrl: element["medium_thumbnail"],
          //   ));
          // }
/////////////////////////////////////////////
          // else{
          //
          //     widgetList.add(
          //       Container(
          //           height: 220,
          //           width:146,
          //           child: Icon(Icons.do_not_disturb, color: Colors.grey,size:50 ,)),
          //     );
          //
          // }
          //
        }
      }
    });

    return widgetList;
  }

  String extractLink({@required String source}) {
    String text = source;
    RegExp exp =
        new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    Iterable<RegExpMatch> matches = exp.allMatches(text);
// print(text.substring(matches.last.start, matches.last.end));
    return text.substring(matches.last.start, matches.last.end);
  }
}
