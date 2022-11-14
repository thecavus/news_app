import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/widgets/news_list_tile.dart';
import '../colors.dart';
import '../storage/local_storage.dart';

class FavoritesNews extends StatelessWidget {
  const FavoritesNews({super.key});

  @override
  Widget build(BuildContext context) {
    LocalStorage localStorage = LocalStorage();
    var list = localStorage.getArticles();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Favorites",
          style: TextStyle(color: colorBlack, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: colorWhite,
      ),
      body: Container(
          child: localStorage.hasData()
              ? ListView.builder(
                  itemCount: list?.length,
                  itemBuilder: (context, index) {
                    return newsListTile(list![index]);
                  },
                )
              : Center(
                  child: Lottie.asset('assets/animations/empty.json'),
                )),
    );
  }
}
