import 'package:flutter/material.dart';

import 'CategoryHeaderRow.dart';
import 'mainListItem.dart';

enum ItemType { video, audio, book, article }

class HomeScreenSection extends StatelessWidget {
  final List<dynamic> list;

  final CategoryHeaderRow categoryHeaderRow;
  final ItemType itemType;
  const HomeScreenSection(
      {this.categoryHeaderRow, this.itemType = ItemType.article, this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        categoryHeaderRow,
        SizedBox(
          height: 10.0,
        ),
        Container(
          height:
              this.itemType == ItemType.video || this.itemType == ItemType.audio
                  ? 190.0
                  : 200, //edit this to be equal heights
          child: ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              itemBuilder: (c, index) {
                String link = list[index][strType(itemType)]["data"]["link"] !=
                        null
                    ? list[index][strType(itemType)]["data"]["link"]
                    : list[index][strType(itemType)]["data"]["embed_code"] !=
                            null
                        ? extractLink(
                            source: list[index][strType(itemType)]["data"]
                                    ["embed_code"]
                                .toString())
                        : 'habal linkooooooo';

                // print(
                //     "Hi from main screen section of index $index type of $itemType have attachment");

                if (list[index][strType(itemType)]["data"]["attachments"] !=
                    null) {
                  return MainListItem(
                    itemType: itemType,
                    title: list[index]["title"],
                    link: list[index][strType(itemType)]["data"]
                        ["attachments"],
                    imgUrl: list[index]["medium_thumbnail"],
                    attachments: list[index][strType(itemType)]["data"]
                        ["attachments"],
                  );
                } else if (list[index]["books"] != null) {
                  return MainListItem(
                    itemType: itemType,
                    title: list[index]["title"],
                    link: link,
                    imgUrl: list[index]["medium_thumbnail"],
                    attachments: list[index]["books"]["data"]["attachments"],
                  );
                } else if (list[index]["audios"] != null) {
                  return MainListItem(
                    itemType: itemType,
                    title: list[index]["title"],
                    link: link,
                    imgUrl: list[index]["medium_thumbnail"],
                    attachments: list[index]["audios"]["data"]["attachments"],
                  );
                } else {
                  return Container(
                    color: Colors.red,
                  );
                }
              }
              // },
              ),
        ),
        SizedBox(
          height:
              this.itemType == ItemType.video || this.itemType == ItemType.audio
                  ? 20.0
                  : 10.0,
        )
      ],
    );
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

  String extractLink({@required String source}) {
    String text = source;
    RegExp exp =
        new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    Iterable<RegExpMatch> matches = exp.allMatches(text);

    return text.substring(matches.last.start, matches.last.end);
  }
}
