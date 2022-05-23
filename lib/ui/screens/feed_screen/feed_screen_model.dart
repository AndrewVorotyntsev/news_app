import 'package:elementary/elementary.dart';
import 'package:news_app/domain/news_article.dart';
import 'package:news_app/service/news_service.dart';

class NewsFeedModel extends ElementaryModel {
  final NewsService _newsService;

  NewsFeedModel(this._newsService);

  // Получить список новостных статей
  Future<List<NewsArticle>?> getArticles() async {
    return _newsService.getArticles();
  }
}