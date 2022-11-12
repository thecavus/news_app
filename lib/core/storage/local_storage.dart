import 'package:get_storage/get_storage.dart';

import '../model/article_model.dart';

class LocalStorage {
  static const String _key_articles = "key_article";
  List<Article>? articleStorage;

  getArticles() {
    final storage = GetStorage();
    if (storage.read(_key_articles) != null) {
     }
    return storage.read(_key_articles) ?? "null";

    // return articleStorage ?? "null";
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
      var list = [];
      list.add(article);
      storage.write(_key_articles, list);
    }
  }
}
