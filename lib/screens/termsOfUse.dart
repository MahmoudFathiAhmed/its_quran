import 'package:flutter/material.dart';
import 'package:its_quran/screens/templateScreen.dart';

class TermsOfUse extends StatelessWidget {
  static String routeName = '/terms';

  String text='تختلف النفوس سعةً وضيقاً كما تختلف الغرف والمنازل والأماكن؛ فمن الناس من تضيق نفسه حتى تكون كَسَمِّ الخياط، ومنهم من تتسع نفسه حتى تشمل العالم ومافيه، فيكون رحمة للناس كلهم، كما كان سيد ولد آدم عليه الصلاة والسلام \n تضيق النفوس بالجهل وقلة العلم والتجارب، ثم بالعلم والتجربة وقبل   ذلك بالإيمان تتسع وتكون نفساً مشرقة تحب الناس والخير والجمال\ى';
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      title: "الشروط والأحكام",
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              Image.asset(
                'assets/fullsh.png',
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
