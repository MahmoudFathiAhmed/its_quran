import 'package:flutter/material.dart';
import 'package:its_quran/screens/templateScreen.dart';

class ContactScreen extends StatefulWidget {
  static String routeName = '/contactUs';
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  GlobalKey _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> _socialMedia = [
    {
      "img": "fa",
      "func": () {},
    },
    {
      "img": "tw",
      "func": () {},
    },
    {
      "img": "yo",
      "func": () {},
    },
    {
      "img": "mail",
      "func": () {},
    },
  ];
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: TemplateScreen(
        title: "اتصل بنا",
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo.png',
                  scale: 1.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 15),
                          //Name text field
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(hintText: "الاسم"),
                          ),
                          SizedBox(height: 8),
                          //Email text field
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "البريد الإلكتروني",
                            ),
                          ),
                          SizedBox(height: 8),
                          //Subject text field
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "عنوان الرسالة",
                            ),
                          ),
                          SizedBox(height: 8),
                          //Message text field
                          TextFormField(
                            textInputAction: TextInputAction.go,
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText: "نص الرسالة",
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                //TODO: Launch web page more about Midad Cloud system
                              },
                              child: Text('إرسال رسالة',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(
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
                          SizedBox(height: 28.0),
                          Text(
                            'أو تواصل معنا من خلال',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontWeight: FontWeight.w100),
                          ),
                          SizedBox(height: 28.0),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                for (var el in _socialMedia)
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6.0),
                                      child: Image.asset(
                                          "assets/${el['img']}.png"),),
                              ],
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
