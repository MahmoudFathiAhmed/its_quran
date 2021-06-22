import 'package:flutter/material.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:its_quran/widgets/mainListItem.dart';

class SheikhScreenTabContent extends StatelessWidget {
  final ItemType itemsType;

  SheikhScreenTabContent({this.itemsType=ItemType.article});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal:10.0,vertical:15.0),
      physics: BouncingScrollPhysics(),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 10.0,
          spacing: 20.0,
          children: [
            for(int i=0;i<10;i++)
            MainListItem(itemType: itemsType)

          ],
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
}
