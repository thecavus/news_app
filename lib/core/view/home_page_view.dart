import 'package:flutter/material.dart';
 import 'package:news_app/core/view/favorites_news_view.dart';
 import 'news_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int currentIndex = 0;
  final pages = [const NewsView() ,const  FavoritesNews()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        body: IndexedStack(
          index: currentIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() => currentIndex = index),
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "News"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "Favorites")
          ],
        ));
  }
}
