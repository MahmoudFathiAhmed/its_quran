import 'package:flutter/material.dart';
import 'package:its_quran/widgets/back_arrow.dart';

class TemplateScreen extends StatelessWidget {
  Widget body;
  List<Widget> actions=<Widget>[];
  String title;

  TemplateScreen({this.title = 'عنوان الصفحة', this.body,this.actions});
  AppBar customeAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        title.toString(),
        style: Theme.of(context).appBarTheme.textTheme.headline1,
      ),
      centerTitle: true,
      leading: BackArrow(),
      actions: this.actions,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customeAppBar(context),
        body: body ??
            Center(
              child: Text(
              'أضف محتوى الصفحة'
              ),
            ),
      ),
    );
  }
}
