import 'package:flutter/material.dart';
import 'package:its_quran/screens/privacyPolicyScreen.dart';
import 'package:its_quran/screens/templateScreen.dart';
import 'package:url_launcher/url_launcher.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Hero(
                  tag: 'midadc',
                  child: Image.asset(
                    'assets/midadcloud.png',
                    scale: 0.7,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              contentTextStyler(
                raw:
                    " نظام إدارة محتوى عام يُمكن تركبيه على أي موقع أياً كان تخصصه ، بأي عدد من اللغات ، يسهل استخدامه ، ويعرض المحتوي بأنواعه المختلفة من مقالات وكتب ومرئيات وصوتيات",
              ),
              contentTextStyler(
                isHead: true,
                isCenter: true,
                raw: "لماذا مداد كلاود لإدارة المحتوى ؟",
              ),
              contentTextStyler(
                raw:
                    "لا تحتاج لخبرات سابقة فيمكنك إدارة موقعك بنفسك (( ويمكن لمداد عمل إدارة كاملة للموقع ))",
              ),
              contentTextStyler(
                raw: "سهولة إستخدام لوحة التحكم ",
              ),
              contentTextStyler(
                raw:
                    "نظام المحتوى السحابي المدار والذي يسهّل عملية صناعة المحتوى فتستطيع الإستفادة من محتوى كافة المستخدمين لنفس النظام وتشارك محتواك في مساحة سحابية مشتركة",
              ),
              contentTextStyler(
                raw:
                    "مُصمم على معايير علمية في تحسين الظهور على محركات البحث SEO",
              ),
              contentTextStyler(
                raw: "تستطيع ربط المحتوى بمنصات التواصل الإجتماعي",
              ),
              contentTextStyler(
                raw:
                    "تتميز مداد كلاود بالمرونة والقابلية لعرض كافة أنماط الوسائط المتعدد",
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: learnMooreButton(context,
                      text: "المزيد عن النظام",
                      link: 'http://midadecloud.com/'))
            ],
          ),
        ),
      ),
    );
  }
}

///Function to build a button contains "learn more"
///  * specify BuildContext [context]
Widget learnMooreButton(BuildContext context,
    {String text = '', String link = ''}) {
  return Container(
    width: MediaQuery.of(context).size.width * .75,
    child: ElevatedButton.icon(
      onPressed: () async {
        if (await canLaunch(link)) await launch(link);
      },
      icon: Image.asset('assets/more.png'),
      label: Text(text,
          style: Theme.of(context).textTheme.button.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold)),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: Theme.of(context).accentColor,
      ),
    ),
  );
}
