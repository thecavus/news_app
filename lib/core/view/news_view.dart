import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/services/api_services.dart';
import 'package:news_app/core/widgets/news_list_tile.dart';

import '../model/article_model.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
 
  var sortByCatogory = ["pupuler", "relevancy", "popularity"];
  var sortBySelectedItem = 0;

  TextEditingController textEditingController = TextEditingController();
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "News App",
          style: TextStyle(color: colorBlack, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: colorWhite,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: colorBlack, width: 1)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  onEditingComplete: () => setState(() {}),
                  onChanged: (value) {
                    value = textEditingController.text;
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: colorBlack, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextField(
                            onChanged: (value) {
                              value = textEditingController.text;
                            },
                            style: const TextStyle(fontSize: 25),
                            controller: textEditingController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              prefixIconColor: colorBlack,
                              hintText: 'Type a text ',
                              suffixIcon: IconButton(
                                onPressed: textEditingController.clear,
                                icon: const Icon(Icons.clear),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  style: const TextStyle(fontSize: 25),
                  controller: textEditingController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: colorBlack,
                    hintText: 'Type a text ',
                    suffixIcon: IconButton(
                      onPressed: textEditingController.clear,
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
              ),
            ),
          ),
          OutlinedButton(
            style: ButtonStyle(
                side: MaterialStateProperty.all(const BorderSide(
              style: BorderStyle.solid,
            ))),
            onPressed: () {
              setState(() {});
            },
            child: Text(
              "Search",
              style: TextStyle(color: colorBlack, fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder(
                future: apiService.getArticle(
                    query: textEditingController.text == ""
                        ? "news"
                        : textEditingController.text),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Article>? articles = snapshot.data;
                    return ListView.builder(
                        itemBuilder: (context, index) =>
                            newsListTile(articles![index]));
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Lottie.asset(
                          fit: BoxFit.fitWidth,
                          'assets/animations/bot-error.json'),
                    );
                  }
                  return Center(
                    child: Lottie.asset(
                        fit: BoxFit.fitWidth,
                        'assets/animations/loading-files.json'),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
