import 'package:elementary/elementary.dart';
import 'package:news_app/service/news_service.dart';

class NewsDetailsModel extends ElementaryModel {
  final NewsService _newsService;

  NewsDetailsModel(this._newsService);

}