import 'package:flutter/material.dart';

class PDFContent extends StatelessWidget {
  final String content;

  PDFContent(
      {this.content =
          'محتوى مفيد لتعلم القرءان من خلال تطبيق الهاتف الجوال الحالي  '});
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 5.0,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
        child: Text(content * 250,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
                ),
      ),
    );
  }
}
