import 'package:flutter/material.dart';
import 'package:its_quran/screens/templateScreen.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static String routeName = '/privacy';
  String text='سياستنا في الخصوصية كالتالي\n لا يتم تجميع اي معلومات خاصة بالمستخدم إطلاقاً عند تشغيل التطبيق ...\n';
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      title: "سياسة الخصوصية",
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/fullprivacy.png',
                scale: 0.5,
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
              text * 3,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
