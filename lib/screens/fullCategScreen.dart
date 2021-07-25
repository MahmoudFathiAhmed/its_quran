import 'package:flutter/material.dart';
import 'package:its_quran/Provider/home_provider.dart';
import 'package:its_quran/screens/templateScreen.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:its_quran/widgets/searchButton.dart';
import 'package:its_quran/widgets/sheikhScreenTabContentGridView.dart';
import 'package:provider/provider.dart';

class FullCategScreen extends StatefulWidget {
  static String routeName = '/fullCateg';
  @override
  _FullCategScreenState createState() => _FullCategScreenState();
}

class _FullCategScreenState extends State<FullCategScreen> {
  List<bool> filters = [true, false, false];
  String author = "";

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = ModalRoute.of(context).settings.arguments;

    String title = map["title"];
    ItemType type = map["type"];

    return TemplateScreen(
      title: title,
      actions: [
        SearchButon(),
        Builder(
          builder: (context) => InkWell(
            child: Image.asset('assets/filter.png'),
            onTap: () {
              showModalBottomSheet(
                context: context,
                enableDrag: true,
                backgroundColor: Colors.transparent,
                builder: (_) {
                  return StatefulBuilder(builder: (BuildContext context,
                      StateSetter setState /*You can rename this!*/) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'فرز حسب',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text(
                              'قم بفرز التصنيف على حسب الشيخ',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  filters[0] = true;
                                  filters[1] = false;
                                  filters[2] = false;
                                  author = "";
                                });
                              },
                              title: Text(
                                'الكل',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              trailing: filters[0]
                                  ? Image.asset('assets/tick.png')
                                  : Container(
                                      width: 0,
                                      height: 0,
                                    ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  filters[0] = false;
                                  filters[1] = true;
                                  filters[2] = false;
                                  author = "1";
                                });
                              },
                              title: Text(
                                'د/ أحمد عبد المنعم',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              trailing: filters[1]
                                  ? Image.asset('assets/tick.png')
                                  : Container(
                                      width: 0,
                                      height: 0,
                                    ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  filters[0] = false;
                                  filters[1] = false;
                                  filters[2] = true;

                                  author = "2";
                                });
                              },
                              title: Text(
                                'ش/ عمرو الشرقاوي',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              trailing: filters[2]
                                  ? Image.asset('assets/tick.png')
                                  : Container(
                                      width: 0,
                                      height: 0,
                                    ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Provider.of<HomeProvider>(context,
                                          listen: false)
                                      .changeAuthor(author: author);
                                  Navigator.of(context).pop();
                                },
                                child: Text('تطبيق',
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold)),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.all(10.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  backgroundColor:
                                      Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              );
            },
          ),
        )
      ],
      body: SheikhScreenTabContent(
        itemsType: type,
      ),
    );
  }
}
