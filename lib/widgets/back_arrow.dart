import 'package:flutter/material.dart';
class BackArrow extends StatelessWidget {
  const BackArrow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Tooltip(
message: 'رجوع',
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/back.png",
          ),
        ),
      );
    });
  }
}