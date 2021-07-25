import 'package:flutter/material.dart';
import 'package:its_quran/Provider/home_provider.dart';
import 'package:its_quran/services/get_api_data.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:its_quran/widgets/mainListItem.dart';
import 'package:provider/provider.dart';

class SheikhScreenTabContent extends StatelessWidget {
  final ItemType itemsType;
  final GetAPIData apiData=GetAPIData();



  SheikhScreenTabContent({this.itemsType=ItemType.article});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal:10.0,vertical:15.0),
      physics: BouncingScrollPhysics(),
      child: Center(
        child: FutureBuilder(
          future: apiData.getData(type:strType(itemsType) , pageNumber: "1", perPage: "30", author: Provider.of<HomeProvider>(context).author),
          builder: (c,snapshot){

            if(!snapshot.hasData){

              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.amber,
                  //
                ),
              );
            }else{
              List list=snapshot.data;

              return Wrap(
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 10.0,
                spacing: 20.0,
                children: mainListItem(type: itemsType, list: list),
              );
            }
          },
        ),
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



  List<Widget>mainListItem({@required ItemType type ,@required List list}){
   List< Widget >widgetList=[];

    list.forEach((element) {
      // print(element);
      if (element!=null) {
        if (element[strType(type)]["data"]["link"] !=null){
          widgetList.add(

              MainListItem(itemType: type, title: element["title"],
                link: element[strType(type)]["data"]["link"],
                imgUrl: element["medium_thumbnail"],

              )
          );
        }else if(element[strType(type)]["data"]["attachments"] !=null){
          widgetList.add(

              MainListItem(itemType: type, title: element["title"],
                link: element[strType(type)]["data"]["attachments"],
                imgUrl: element["medium_thumbnail"],

              )
          );
        }else if(element[strType(type)]["data"]["embed_code"]!=null){

          widgetList.add(

              MainListItem(itemType: type, title: element["title"],
                link:extractLink(source: element[strType(type)]["data"]["embed_code"].toString()),
                imgUrl: element["medium_thumbnail"],

              )
          );

        }



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
      }



    });


    return widgetList;
  }

  String extractLink({@required String source}){



    String text=source;
    RegExp exp = new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    Iterable<RegExpMatch> matches = exp.allMatches(text);
// print(text.substring(matches.last.start, matches.last.end));
    return text.substring(matches.last.start, matches.last.end);




  }


}
