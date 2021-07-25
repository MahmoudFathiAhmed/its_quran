import 'package:flutter/material.dart';
import 'package:its_quran/screens/templateScreen.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:its_quran/widgets/back_arrow.dart';
import 'package:its_quran/widgets/sheikhScreenTabContentGridView.dart';

class SheikhScreen extends StatefulWidget {
  static String routeName = '/sheikhScreen';

  @override
  _SheikhScreenState createState() => _SheikhScreenState();
}

class _SheikhScreenState extends State<SheikhScreen> {
  List<bool> filters = [
    true,
    false,
    false,
    false,
    false,
    false,
  ];

  Widget _buildFilterListTile(int index, String title, String imgName) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            setState(() {
              for (var i = 0; i < filters.length; i++) {
                filters[i] = false;
              }
              filters[index] = true;

              print('clicked');
            });
          },
          leading: Image.asset('assets/${imgName}.png'),
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontWeight: FontWeight.bold),
          ),
          trailing: filters[index]
              ? Image.asset('assets/tick.png')
              : Image.asset('assets/outline.png'),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String title  =ModalRoute.of(context).settings.arguments;




    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: BackArrow(),
            centerTitle: true,
            title: Text(
              title,
              style: Theme.of(context).appBarTheme.textTheme.headline1,
            ),
            bottom: TabBar(
              labelStyle:
                  Theme.of(context).textTheme.caption.copyWith(fontSize: 14.0),
              unselectedLabelColor: Colors.white,
              labelColor: Theme.of(context).accentColor,
              labelPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              tabs: [
                Text("دروس ومحاضرات"),
                Text("الكتب"),
                // Text("المقالات"),
                // Text("البحوث"),
                Text("دورات مصورة"),
              ],
              isScrollable: true,
            ),
            actions: [
              // InkWell(
              //   onTap: () {},
              //   child: Image.asset('assets/filter.png'),
              // ),
              // Builder(
              //   builder: (context) => InkWell(
              //     child: Image.asset('assets/filter.png'),
              //     onTap: () {
              //       showModalBottomSheet(
              //         context: context,
              //         enableDrag: true,
              //         backgroundColor: Colors.transparent,
              //         builder: (_) {
              //           return StatefulBuilder(builder: (BuildContext context,
              //               StateSetter setState /*You can rename this!*/) {
              //             return Container(
              //               padding: EdgeInsets.symmetric(
              //                   vertical: 20.0, horizontal: 10.0),
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.only(
              //                   topLeft: Radius.circular(30.0),
              //                   topRight: Radius.circular(30.0),
              //                 ),
              //               ),
              //               child: SingleChildScrollView(
              //                 physics: BouncingScrollPhysics(),
              //                 child: Column(
              //                   mainAxisSize: MainAxisSize.min,
              //                   children: <Widget>[
              //                     Text(
              //                       'فرز بواسطة',
              //                       style:
              //                           Theme.of(context).textTheme.bodyText2,
              //                     ),
              //                     Text(
              //                       'قم بعرض المحتوى حسب القسم',
              //                       style: Theme.of(context).textTheme.caption,
              //                     ),
              //                     SizedBox(
              //                       height: 20.0,
              //                     ),
              //                     _buildFilterListTile(0, 'كل المواد', 'allsm'),
              //                     _buildFilterListTile(
              //                         1, 'مناشط الشيخ', 'fullsh'),
              //                     _buildFilterListTile(2, 'الكتب', 'mnsm'),
              //                     _buildFilterListTile(
              //                         3, 'المثالات', 'taartact'),
              //                     _buildFilterListTile(
              //                         4, 'الصوتيات', 'tasoundact'),
              //                     _buildFilterListTile(
              //                         5, 'المرئيات', 'vidsm'),
              //                     SizedBox(
              //                       height: 10.0,
              //                     ),
              //                     Container(
              //                       width: double.infinity,
              //                       padding:
              //                           EdgeInsets.symmetric(horizontal: 10.0),
              //                       child: ElevatedButton(
              //                         onPressed: () {
              //                           Navigator.of(context).pop();
              //                         },
              //                         child: Text('تطبيق',
              //                             style: Theme.of(context)
              //                                 .textTheme
              //                                 .button
              //                                 .copyWith(
              //                                     color: Theme.of(context)
              //                                         .primaryColor,
              //                                     fontWeight: FontWeight.bold)),
              //                         style: OutlinedButton.styleFrom(
              //                           padding: EdgeInsets.all(10.0),
              //                           shape: RoundedRectangleBorder(
              //                               borderRadius:
              //                                   BorderRadius.circular(20.0)),
              //                           backgroundColor:
              //                               Theme.of(context).accentColor,
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             );
              //           });
              //         },
              //       );
              //     },
              //   ),
              // )
            ],
          ),
          body: TabBarView(
            children: [
              SheikhScreenTabContent(itemsType: ItemType.video,),
              SheikhScreenTabContent(itemsType: ItemType.book,),
              // SheikhScreenTabContent(itemsType: ItemType.article),
              // SheikhScreenTabContent(itemsType: ItemType.article),
              SheikhScreenTabContent(itemsType: ItemType.audio,),
            ],
          ),
        ),
      ),
    );
  }
}
