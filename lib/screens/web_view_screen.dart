import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewScreen extends StatefulWidget {
  static String routeName = '/web_view_screen';


  const WebViewScreen({Key key}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen>  {

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();


  @override
  void initState() {




    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();//




    super.initState();
  }








  @override
  Widget build(BuildContext context) {

  String  link=ModalRoute.of(context).settings.arguments;
    print("link");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: WebView(
          initialUrl: link,
          onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);

        },
          javascriptMode: JavascriptMode.unrestricted,


        ),
      ),
    );
  }
}
