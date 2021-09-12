import 'package:flutter/material.dart';
import 'package:its_quran/screens/templateScreen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'midadCloudSystem.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static String routeName = '/privacy';
  String text =
      'سياستنا في الخصوصية كالتالي\n لا يتم تجميع اي معلومات خاصة بالمستخدم إطلاقاً عند تشغيل التطبيق ...\n';

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      title: "سياسة الخصوصية",
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/fullprivacy.png',
                  scale: 0.5,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              contentTextStyler(
                isHead: true,
                isCenter: true,
                raw: "بيان الخصوصية",
              ),
              contentTextStyler(
                raw:
                    "يتعهد موقع إنَّه الْقُرْآن بالحفاظ على سرية بياناتك وخصوصياتك. وتنطبق هذه الوثيقة على كل البيانات التي يتم تجميعها من خلال الموقع. هذه الصفحة توضح الوجه الذي سيتم عبره استخدام أي معلومات شخصية تزودنا بها خلال استخدامك للموقع. ",
              ),
              contentTextStyler(
                isHead: true,
                raw: " انتفاء المسؤولية القانونية",
              ),
              contentTextStyler(
                raw:
                    "يقر المُستخدِم بأنه المسؤول الوحيد عن طبيعة الاستخدام الذي يحدده لموقع إنَّه الْقُرْآن وموقعه الإلكتروني، وتخلي إدارة الموقع طرفها، إلى أقصى مدى يجيزه القانون، من كامل المسؤولية عن أية خسائر أو أضرار يتكبدها المُستخدِم أو يتعرض لها هو أو أي طرف آخر من جراء استخدام الموقع أو العجز عن استخدامه. المستخدم مسؤول عن طبيعة الاستخدام وعن أي نشاط يقوم المستخدم بتوجيه خدمات موقع إنَّه الْقُرْآن إليه، مع كامل الحق لموقع إنَّه الْقُرْآن في حجب أي معلومات قام المستخدم بنشرها قد تراها إدارة موقع إنَّه الْقُرْآن مخالفة للقانون وأحكام الشريعة الإسلامية. ",
              ),
              contentTextStyler(
                isHead: true,
                raw: "حالات انقطاع الخدمة والسهو والخطأ في الموقع الإلكتروني",
              ),
              contentTextStyler(
                raw:
                    "تبذل إدارة موقع إنَّه الْقُرْآن قصارى جهدها للحرص والحفاظ على استمرار عمل الموقع بدون مشاكل، رغم ذلك قد تقع في أي وقت أخطاء وحالات سهو وانقطاع للخدمة وتأخير لها، وفي مثل هذه الحالات سنتوقع من المستخدمين الصبر حتى تعود الخدمة إلى معدلها الطبيعي.",
              ),
              contentTextStyler(
                isHead: true,
                raw: "حساب المشترك وكلمة السر وأمن المعلومات",
              ),
              contentTextStyler(
                raw:
                    "يختار المشترك كلمة سر / مرور لحسابه، وسيُدخل عنوانا بريديا خاصا به كمدير للموقع، وإنشاء مستخدمين آخرين على الموقع كموظفين وتكون مسؤولية حماية تلك الحسابات وكلمات المرور الخاصة بها مسؤولية العميل، وفي حال حدوث أي معاملات باستخدام كلمة السر هذه سيتحمل العميل وموظفيه كافة المسؤوليات المترتبة على ذلك، دون أدنى مسؤولية على موقع إنَّه الْقُرْآن.",
              ),
              contentTextStyler(
                raw:
                    " يتحمل المشترك كامل المسؤولية عن جميع المحتويات الخاصة به، التي يرفعها وينشرها عبر الموقع. ",
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                alignment:Alignment.center ,
                  child: learnMooreButton(context,
                      text: "المزيد عن سياسة الخصوصية",
                      link: "https://itsthequran.com/ar/privacy-policy")),
            ],
          ),
        ),
      ),
    );
  }
}

///Function to return a stylized text according to its role [header or body] Text
///  * specify the alignment "isHeader"
///  * specify the role "isCenter"
///  * specify the raw text to stylize "raw"
Widget contentTextStyler(
    {String raw = '', bool isHead = false, bool isCenter = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: isHead ? 8 : 5),
    child: Text(
      raw,
      style: TextStyle(
        fontSize: isHead ? 14 : 12,
        fontWeight: isHead ? FontWeight.bold : FontWeight.normal,
      ),
      textAlign: isCenter ? TextAlign.center : TextAlign.right,
    ),
  );
}
