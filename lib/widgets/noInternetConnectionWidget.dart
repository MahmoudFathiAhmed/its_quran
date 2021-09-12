import 'package:flutter/material.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  const NoInternetConnectionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.wifi_lock,
            size: 75,
            color: Theme.of(context).accentColor.withOpacity(0.8),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text('تأكد من اتصالك بالإنترنت',
          style: TextStyle(fontWeight:FontWeight.w200 ),)
        ],
      ),
    );
  }
}