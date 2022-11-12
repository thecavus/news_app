import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/storage/local_storage.dart';
import 'package:news_app/core/view/home_page_view.dart';
import 'package:news_app/core/view/news_source.dart';
import 'package:share_plus/share_plus.dart';

import '../model/article_model.dart';

class NewsDetailView extends StatefulWidget {
  Article article;
  NewsDetailView({super.key, required this.article});

  @override
  State<NewsDetailView> createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetailView> {
  LocalStorage localStorage = LocalStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: colorWhite,
        leading: IconButton(
            color: colorBlack,
            onPressed: () => Get.to( const HomePageView()),
            icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          Row(
            children: [
              IconButton(
                color: colorBlack,
                onPressed: () {
                  Share.share(widget.article.url);
                },
                icon:const Icon(Icons.ios_share),
              ),
              IconButton(
                color: colorBlack,
                onPressed: () {
                  localStorage.setArticle(widget.article);
                  setState(() {});
                },
                icon: localStorage.isLiked(widget.article)
                    ?const Icon(Icons.favorite)
                    :const Icon(Icons.favorite_border),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(widget.article.urlToImage)),
          const  SizedBox(
              height: 10,
            ),
            Text(
              widget.article.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          const  SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    const Icon(Icons.person),
                    Text(widget.article.author ?? "author"),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.date_range_outlined),
                    Text(widget.article.publishedAt),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.article.content,
              style: const TextStyle(fontSize: 20),
            ),
            OutlinedButton(
                style: ButtonStyle(
                    side: MaterialStateProperty.all( const BorderSide(
                  style: BorderStyle.solid,
                ))),
                onPressed: () {
                  print("source butonuna basıldlı..");
                  Get.to(NewsSource(article: widget.article));
                },
                child: Text(
                  "Go To News Source",
                  style: TextStyle(color: colorBlack, fontSize: 25),
                )),
          ],
        ),
      ),
    );
  }
}
