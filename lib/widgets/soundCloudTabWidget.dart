import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

// class SoundCloudTab extends StatefulWidget {
//   @override
//   _SoundCloudTabState createState() => _SoundCloudTabState();
// }

// class _SoundCloudTabState extends State<SoundCloudTab> {
//   @override
//   void initState() {
//     super.initState();
//     // Enable hybrid composition.
//     if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//   }
class SoundCloudTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://soundcloud.com/salem-tech-782013788/ebrahim-p01',
      allowsInlineMediaPlayback: true,
      debuggingEnabled: true,
      gestureNavigationEnabled: true,
      initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      javascriptMode: JavascriptMode.unrestricted,
      onWebResourceError: (_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            children: <Widget>[
              Icon(
                Icons.error_outline_rounded,
                color: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'حدث خطأ',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white),
              )
            ],
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
      },
    );
  }
}
