import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MyWebView extends StatefulWidget {
  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  final String url = 'https://www.example.com'; // Replace with your website URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My WebView App'),
      ),
      body: 
      WebViewWidget(controller:  WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
  onPageFinished: (String url) {
          // Inject JavaScript code to hide the navigation bar
          final script = '''
            var navBar = document.querySelector('header'); // Replace 'header' with the actual selector for your navigation bar
            navBar.style.display = 'none';
          ''';
          // webView.evaluateJavascript(script);
        },
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse("https://www.fiverr.com/login")),)
      // WebView(
      //   initialUrl: url,
      //   javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
      //   onPageFinished: (String url) {
      //     // Inject JavaScript code to hide the navigation bar
      //     final script = '''
      //       var navBar = document.querySelector('header'); // Replace 'header' with the actual selector for your navigation bar
      //       navBar.style.display = 'none';
      //     ''';
      //     webView.evaluateJavascript(script);
      //   },
      // ),
    );
  }

  // Create a WebView controller for interacting with the WebView
  // final Completer<WebViewController> _controller = Completer<WebViewController>();
}
