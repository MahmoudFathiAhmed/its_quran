import 'package:flutter/material.dart';
import 'package:its_quran/widgets/CategoryHeaderRow.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:its_quran/widgets/appDrawer.dart';
import 'package:its_quran/widgets/mainListItem.dart';
import 'package:its_quran/widgets/searchButton.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey _scaffolfKey = GlobalKey<ScaffoldState>();
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
              HomeScreenSection(
                itemType: ItemType.article,
                categoryHeaderRow: CategoryHeaderRow(
                  title: 'مناشط الشيخ',
                  caption: 'جميع مناشط الشيخ المضافة',
                ),
              ),
              HomeScreenSection(
                itemType: ItemType.video,
                categoryHeaderRow: CategoryHeaderRow(
                  title: 'فيديوهات',
                  caption: 'جميع المحاضرات المرتبة',
                ),
              ),
              HomeScreenSection(
                itemType: ItemType.audio,
                categoryHeaderRow: CategoryHeaderRow(
                  title: 'الصوتيات',
                  caption: 'جميع المقاطع الصوتية',
                ),
              ),
              HomeScreenSection(
                itemType: ItemType.book,
                categoryHeaderRow: CategoryHeaderRow(
                  title: 'الكتب',
                  caption: 'الكتب المضافة مؤخراً',
                ),
              ),
              HomeScreenSection(
                categoryHeaderRow: CategoryHeaderRow(
                  title: 'المقالات',
                  caption: 'جميع المقالات المضافة',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
