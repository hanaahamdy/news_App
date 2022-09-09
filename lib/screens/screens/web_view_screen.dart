import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Web_View_Screen extends StatelessWidget {
  final  url;

  const Web_View_Screen({ required this.url});
  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(),
      body: WebView(initialUrl:url ,),);
  }
}
