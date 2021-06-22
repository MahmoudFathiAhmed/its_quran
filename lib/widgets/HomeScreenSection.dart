import 'package:flutter/material.dart';

import 'CategoryHeaderRow.dart';
import 'mainListItem.dart';

enum ItemType { video, audio, book, article }

class HomeScreenSection extends StatelessWidget {
  final CategoryHeaderRow categoryHeaderRow;
  final ItemType itemType;
  const HomeScreenSection(
      {this.categoryHeaderRow, this.itemType = ItemType.article});

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
                  ? 230.0
                  : 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            children: new List.generate(
              10,
              (index) => MainListItem(
                itemType: this.itemType,
              ),
            ),
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
}
