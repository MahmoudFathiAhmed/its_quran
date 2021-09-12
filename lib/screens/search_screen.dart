import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:its_quran/services/get_api_data.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:its_quran/widgets/back_arrow.dart';
import 'package:its_quran/widgets/mainListItem.dart';
import 'package:its_quran/widgets/noInternetConnectionWidget.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = '/SearchScreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GetAPIData apiData = GetAPIData();
  String text = "";
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder _outLineBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Colors.black45,
        ));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "بحث",
            style: Theme.of(context).appBarTheme.textTheme.headline1,
          ),
          centerTitle: true,
          leading: BackArrow(),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: 35,
              child: TextField(
                onSubmitted: (value) {
                  setState(() {
                    text = value;
                    _isLoading = true;
                  });
                },
                cursorColor: Colors.grey[600],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "بحث",
                  hintStyle: TextStyle(color: Colors.black45),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: _outLineBorder,
                  border: _outLineBorder,
                  focusedBorder: _outLineBorder,
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.red,
                child: text.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              size: 55,
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.8),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              'قم بإدخال كلمة للبحث',
                              style: TextStyle(
                                fontSize:14.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      )
                    : FutureBuilder(
                        future: apiData.getSearchData(text: text),
                        builder: (c, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: Center(
                                child: CircularProgressIndicator(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  //
                                ),
                              ),
                            );
                          } else if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.data == null) {
                            return NoInternetConnectionWidget();
                          } else {
                            List list = snapshot.data;
                            if (list.length == 0) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: Center(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.search_off,
                                        size: 50.0,
                                        color: Theme.of(context)
                                            .accentColor
                                            .withOpacity(0.7)),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      "لا يوجد نتائج بحث تطابق ما تم إدخاله\n جرب البحث بكلمة أخرى",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                )),
                              );
                            } else {
                              print(
                                  "search result list lenght is ${list.length}");
                              return Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.85),
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'تم العثور على ${list.length} من النتائج',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        child: GridView.builder(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15.0,
                                        horizontal: 5,
                                      ),
                                      itemCount: list.length,
                                      // list.length,
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                        childAspectRatio: 146 / 170,
                                        maxCrossAxisExtent: 250.0,
                                        crossAxisSpacing: 5.0,
                                        mainAxisSpacing: 5.0,
                                      ),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return mainListItem(list: list)[index];
                                      },
                                    )),
                                  ),
                                ],
                              );
                            }
                          }
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> mainListItem({@required List list}) {
    List<Widget> widgetList = [];

    list.forEach((element) {
      if (element != null) {
        if (element["videos"] != null) {
          print("v");
          widgetList.add(MainListItem(
            itemType: ItemType.video,
            title: element["title"],
            link: element["videos"]["data"]["link"],
            imgUrl: element["medium_thumbnail"],
          ));
        } else if (element["books"] != null) {
          widgetList.add(MainListItem(
            itemType: ItemType.book,
            title: element["title"],
            link: element["books"]["data"]["attachments"],
            imgUrl: element["medium_thumbnail"],
          ));
        } else if (element["audios"] != null) {
          widgetList.add(MainListItem(
            itemType: ItemType.audio,
            title: element["title"],
            link: extractLink(
                source: element["audios"]["data"]["embed_code"].toString()),
            imgUrl: element["medium_thumbnail"],
          ));
        } else if (element["article"] != null) {
          widgetList.add(MainListItem(
            itemType: ItemType.article,
            title: element["title"],
            link: "www.google.com",
            imgUrl: element["medium_thumbnail"],
          ));
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
    print(text.substring(matches.last.start, matches.last.end));
    return text.substring(matches.last.start, matches.last.end);
  }
}

// MainListItem(itemType: ItemType.video,
// imgUrl: "https://cloudelib.midadedev.com/assets/media/afamn-althyn-mkroa-alsyeat320_mediumThumb.jpg",
// link: "https://www.youtube.com/watch?v=mq6XzTtyujc",
// title: "أفأمن الذين مكروا السيئات",
// ),
