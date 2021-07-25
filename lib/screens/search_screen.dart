import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:its_quran/Provider/home_provider.dart';
import 'package:its_quran/services/get_api_data.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:its_quran/widgets/mainListItem.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = '/SearchScreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GetAPIData apiData = GetAPIData();
  String text = "";

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
          centerTitle: true,
          title: Text(
            "بحث",
            style: Theme.of(context).appBarTheme.textTheme.headline1,
          ),
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
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                physics: BouncingScrollPhysics(),
                child: Center(
                  child: FutureBuilder(
                    future: apiData.getSearchData(text: text),
                    builder: (c, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.amber,
                            //
                          ),
                        );
                      } else {
                        List list = snapshot.data;
                        if (list.length == 0) {
                          return Center(
                              child: Text(
                            "لا يوجد نتائج بحث",
                            style: TextStyle(fontSize: 24),
                          ));
                        } else {
                          return Wrap(
                            alignment: WrapAlignment.start,
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runSpacing: 10.0,
                            spacing: 20.0,
                            children: mainListItem(list: list),
                          );
                        }
                      }
                    },
                  ),
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
        } else {
          widgetList.add(
            Container(
                height: 220,
                width: 146,
                child: Icon(
                  Icons.do_not_disturb,
                  color: Colors.red,
                )),
          );
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
