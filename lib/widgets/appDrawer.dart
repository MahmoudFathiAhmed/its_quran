import 'package:flutter/material.dart';
import 'package:its_quran/Provider/home_provider.dart';
import 'package:its_quran/screens/contactUs.dart';
import 'package:its_quran/screens/midadCloudSystem.dart';
import 'package:its_quran/screens/privacyPolicyScreen.dart';
import 'package:its_quran/screens/categsScreen.dart';
import 'package:its_quran/screens/sheikhScreen.dart';
import 'package:its_quran/screens/termsOfUse.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // width: MediaQuery.of(context).size.width*0.65,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        //color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                child: null,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/sidelogobg.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                color: Colors.red,
              ),
              ListTile(
                title: Text('الرئيسية'),
                leading: Image.asset(
                  'assets/home.png',
                  scale: 0.9,
                ),
              ),
              ListTile(
                title: Text('الأقسام'),
                leading: Image.asset(
                  'assets/categ.png',
                  scale: 0.9,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(CategsScreen.routeName),
              ),
              ListTile(
                title: Text('د/ أحمد عبد المنعم'),
                leading: Image.asset(
                  'assets/monem.png',
                  scale: 0.8,
                ),
                onTap: () {
                  Provider.of<HomeProvider>(context,listen: false).changeAuthor(author: "1");
                  Navigator.of(context).pushNamed(
                      SheikhScreen.routeName, arguments: "د/ أحمد عبد المنعم");

                }
              ),
              ListTile(
                title: Text('ش/ عمرو الشرقاوي'),
                leading: Image.asset(
                  'assets/sharkawy.png',
                  scale: 0.8,
                ),
                onTap: (){
                  Provider.of<HomeProvider>(context,listen: false).changeAuthor(author: "2");
                  Navigator.of(context).pushNamed(SheikhScreen.routeName,arguments: "ش/ عمرو الشرقاوي");
                },
              ),
              ListTile(
                title: Text('سياسة الخصوصية'),
                leading: Image.asset(
                  'assets/fullprivacy.png',
                  scale: 2.4,
                ),
                onTap: () => Navigator.of(context)
                    .pushNamed(PrivacyPolicyScreen.routeName),
              ),
              ListTile(
                title: Text('الشروط والأحكام'),
                leading: Image.asset(
                  'assets/fullsh.png',
                  scale: 2.9,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(TermsOfUse.routeName),
              ),
              ListTile(
                title: Text('اتصل بنا'),
                leading: Image.asset(
                  'assets/contact.png',
                  scale: 0.9,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(ContactScreen.routeName),
              ),
              // ListTile(
              //   title: Text('نظام مداد كلاود'),
              //   leading: Image.asset(
              //     'assets/midadcloud.png',
              //     scale: 3,
              //   ),
              //   onTap: () =>
              //       Navigator.of(context).pushNamed(MidadCloudSystem.routeName),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
