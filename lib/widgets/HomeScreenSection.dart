import 'package:flutter/material.dart';

import 'CategoryHeaderRow.dart';
import 'mainListItem.dart';

enum ItemType { video, audio, book, article }

class HomeScreenSection extends StatelessWidget {

final List<dynamic>list;

  final CategoryHeaderRow categoryHeaderRow;
  final ItemType itemType;
  const HomeScreenSection(
      {this.categoryHeaderRow, this.itemType = ItemType.article,this.list});

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
          child: ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            itemBuilder: (c,index){






 // if(list[index][strType(itemType)]["data"]["link"]==null){
 //   return Center(child: Container(height:146,width: 220 ,child: Icon(Icons.do_not_disturb,color: Colors.red,)),);
 // }else{
 //
if(list[index][strType(itemType)]["data"]["link"]!=null){
    return MainListItem(
      itemType: itemType,
      title: list[index]["title"],
      link: list[index][strType(itemType)]["data"]["link"],
      imgUrl: list[index]["medium_thumbnail"],


    );
  }else if(list[index][strType(itemType)]["data"]["attachments"]!=null){
    return MainListItem(
      itemType: itemType,
      title: list[index]["title"],
      link: list[index][strType(itemType)]["data"]["attachments"],

      imgUrl: list[index]["medium_thumbnail"],


    );
  }else if(list[index][strType(itemType)]["data"]["embed_code"]!=null){
  return MainListItem(
    itemType: itemType,
    title: list[index]["title"],
      
    link: extractLink(source: list[index][strType(itemType)]["data"]["embed_code"].toString()),

    imgUrl: list[index]["medium_thumbnail"],


  );


}

else{
  return Center(child: Container(height:146,width: 220 ,child: Icon(Icons.do_not_disturb,color: Colors.red,)),);
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
  
  
 String strType(ItemType type){
    String str;
    switch(type){
      
      case ItemType.video:{str= "videos";}break;
      case ItemType.book:{str="books";}break;
      case ItemType.article:{ str="articles";}break;
      case ItemType.audio:{str="audios";}break;
      
      
       

      
    }
    return str;
 }


String extractLink({@required String source}){



  String text=source;
  RegExp exp = new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
  Iterable<RegExpMatch> matches = exp.allMatches(text);

return text.substring(matches.last.start, matches.last.end);




}

  
}