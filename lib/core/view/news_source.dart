import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/model/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
 import '../colors.dart';
import 'home_page_view.dart';
 class NewsSource extends StatefulWidget {
  Article article;
    NewsSource({super.key,required this.article});

  @override
  State<NewsSource> createState() => _NewsSourceState();
}

class _NewsSourceState extends State<NewsSource> {

  @override
  void initState() {
   

    super.initState(); 
      if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: colorWhite,
        leading: IconButton(
            color: colorBlack,
            onPressed: () => Get.to(const HomePageView()),
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body:   WebView( 
        javascriptMode: JavascriptMode.unrestricted,
         initialUrl: widget.article.url ),
    );
  }
}
