import 'dart:convert'; 
 import 'package:logger/logger.dart';
 import 'package:http/http.dart' as http;
import 'package:news_app/core/constants.dart';
import '../model/article_model.dart';

class ApiService {
 
 
    
  Future<List<Article>?> getArticle(
  
      {  String query='news', 
         }) async {
    Uri uri = Uri.parse(
        'https://newsapi.org/v2/everything?q=$query&apiKey=$API_KEY');

    try {
      var res = await http.get(uri);
      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);
        List<dynamic> body = json['articles'];
        List<Article> articles =
            body.map((article) => Article.fromJson(article)).toList();
        return articles;
      } else {
        throw ('Articles Getirilemedi!!!');
      }
    } on Exception catch (e) {
      Logger().e(e);
    
 }
  }
}
