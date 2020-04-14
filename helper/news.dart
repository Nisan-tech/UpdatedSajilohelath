import 'dart:convert';
import 'package:sajilohealth/models/article.dart';
import 'package:http/http.dart'as http;

class News{
  List<Article>news=[];
  Future<void> getNews()  async {
    String url="https://newsapi.org/v2/top-headlines?country=us&apiKey=cd2d7657b3df429189fc76af48eae1de";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["context"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }


  }


}
  