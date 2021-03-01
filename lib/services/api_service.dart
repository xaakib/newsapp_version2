import 'package:newsapp_version2/models/news_article.dart';
import 'package:http/http.dart' as http;

News _news;

class Services {
  static const String url =
      "http://newsapi.org/v2/everything?q=apple&from=2021-02-27&to=2021-02-27&sortBy=popularity&apiKey=c5d0829c93794ce3a717ad6f55787aaa";
  static Future<List<News>> getNews() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<News> news = News.fromJson(response.body);
        return news;
      } else {
        return List<News>();
      }
    } catch (e) {
      return List<News>();
    }
  }
}
