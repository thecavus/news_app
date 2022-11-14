import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
 import 'package:news_app/core/storage/local_storage.dart';
import 'package:news_app/core/view/favorites_news_view.dart';
import 'package:news_app/core/view/home_page_view.dart';
import 'package:news_app/core/view/news_view.dart';

Future<void> main() async {
    await GetStorage.init();
 // LocalStorage localStorage = LocalStorage();
 // localStorage.clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (p0) => const HomePageView(),
        '/favorites_news': (p0) => const FavoritesNews(),
        '/news_view': (p0) => const NewsView()
      },
    );
  }
}
