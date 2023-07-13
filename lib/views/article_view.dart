 import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:async';

class ArticleView extends StatefulWidget {
  final String? blogUrl;

  const ArticleView({
    Key? key,
    this.blogUrl,
  }) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<InAppWebViewController> completer = Completer<InAppWebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter", style: TextStyle(color: Colors.black)),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        actions: [
          Opacity(
             opacity: 0,
          child: Container(
            padding:const  EdgeInsets.symmetric(horizontal: 16),
          ),
          )
        ],
        centerTitle: false,
        
        elevation: 0.0,
      ),
      body:Container(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(widget.blogUrl ?? '')),
          onWebViewCreated: ((InAppWebViewController webViewController) {
            completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
