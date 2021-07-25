import 'package:flutter/material.dart';
import 'package:its_quran/Provider/home_provider.dart';
import 'package:its_quran/screens/categsScreen.dart';
import 'package:its_quran/screens/fullCategScreen.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:provider/provider.dart';

class CategoryHeaderRow extends StatelessWidget {
  final String title;
  final String caption;
  final ItemType type;


  const CategoryHeaderRow({

     @required this.title = '',
     @required this.caption = '',
    @required this.type,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(this.title),
              Text(
                this.caption,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
          OutlinedButton.icon(
            onPressed: () {
Map<String,dynamic> map=Map();
map["type"]=type;
map["title"]=title;
Provider.of<HomeProvider>(context,listen: false).changeAuthor(author: "");

              Navigator.of(context).pushNamed(FullCategScreen.routeName,arguments:map );



            },
            icon: Image.asset('assets/right.png'),
            label: Text('شاهد الكل',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Theme.of(context).accentColor)),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              side: BorderSide(
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
