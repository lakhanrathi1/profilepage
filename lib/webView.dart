import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web_View extends StatefulWidget {
  const Web_View({Key? key}) : super(key: key);

  @override
  _Web_ViewState createState() => _Web_ViewState();
}

class _Web_ViewState extends State<Web_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spins spincar"),
      ),
      body: const WebView(
        initialUrl: 'https://spins.spincar.com/Petromin/abcdefg1234567891',
        javascriptMode: JavascriptMode.unrestricted,

      ),
    );
  }
}
