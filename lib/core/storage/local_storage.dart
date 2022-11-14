import 'package:get_storage/get_storage.dart';

import '../model/article_model.dart';

class LocalStorage {
  static const String _key_articles = "key_article";
  List<Article>? articleStorage;

  bool hasData() {
    final storage = GetStorage();
    if (storage.hasData(_key_articles)) {
      return true;
    } else {
      return false;
    }
  }

  List<Article>? getArticles() {
//NOTE : Uygulama kapanıp açıldığında <List<Article>> tipinde kaydettiğim nesne <List<dynamic>> olmaktadır, nedendir çözemedim.
// Sorunu try catch ile kontrol altına aldım, verilerim uygulama  kapanıp açıldıktan sonra <List<dynamic>> tipine dönüşürse mapliyorum.
    final storage = GetStorage();
    if (storage.hasData(_key_articles)) {
      try {
        List<dynamic> list = storage.read(_key_articles);
        List<Article> listArticle =
            list.map((e) => Article.fromJson(e)).toList();
        return listArticle;
      } catch (e) {
        List<Article> list = storage.read(_key_articles);
        return list;
      }
    }
  }

  clear() {
    final storage = GetStorage();
    storage.remove(_key_articles);
  }

  bool isLiked(Article article) {
    final storage = GetStorage();
    var articles = storage.read(_key_articles);
    if (storage.hasData(_key_articles)) {
      if (articles.contains(article)) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  setArticle(Article article) {
    final storage = GetStorage();
    if (storage.hasData(_key_articles)) {
      var list = storage.read(_key_articles);
      if (list.contains(article)) {
        list.remove(article);
        storage.write(_key_articles, list);
      } else {
        list.add(article);
        storage.write(_key_articles, list);
      }
    } else {
      List<Article> list = [];
      list.add(article);
      storage.write(_key_articles, list);
    }
  }
}
