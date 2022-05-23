import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/news_article.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/ui/screens/news_details/news_details_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'news_details_model.dart';

class NewsDetailsWM extends WidgetModel<NewsDetailsScreen, NewsDetailsModel> {
  final NewsArticle _article;

  String get title => _article.title;
  String? get description => _article.description;
  String? get author => _article.author;
  String get url => _article.url;
  String? get urlToImage => _article.urlToImage;

  NewsDetailsWM(NewsDetailsModel model, this._article) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  void goLink() async {
    !await launch(url);
  }
}

NewsDetailsWM createNewsDetailsWM(BuildContext _, NewsArticle article) =>
    NewsDetailsWM(
      NewsDetailsModel(
        NewsService(),
      ),
      article,
    );
