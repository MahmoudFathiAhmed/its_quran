import 'package:flutter/material.dart';
import 'package:its_quran/screens/templateScreen.dart';

class MidadCloudSystem extends StatelessWidget {
  static String routeName = '/midad';
  String text =
      'سياستنا في الخصوصية كالتالي\n لا يتم تجميع اي معلومات خاصة بالمستخدم إطلاقاً عند تشغيل التطبيق ...\n';
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      title: "نظام مداد كلاود",
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/midadcloud.png',
                scale: 0.7,
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                text * 2,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: ElevatedButton.icon(
                  onPressed: () {
                    //TODO: Launch web page more about Midad Cloud system
                  },
                  icon: Image.asset('assets/more.png'),
                  label: Text('المزيد عن النظام',
                      style: Theme.of(context).textTheme.button.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold)),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
