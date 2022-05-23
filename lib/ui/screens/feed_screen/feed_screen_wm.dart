import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/domain/news_article.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/ui/screens/feed_screen/feed_screen.dart';
import 'package:news_app/ui/screens/feed_screen/feed_screen_model.dart';

class NewsFeedWM extends WidgetModel<NewsFeedScreen, NewsFeedModel> {
  final EntityStateNotifier<List<NewsArticle>> _newsArticles =
      EntityStateNotifier(const EntityState.content([]));

  ListenableState<EntityState<List<NewsArticle>>> get newsArticles =>
      _newsArticles;

  NewsFeedWM(NewsFeedModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadArticles();
  }

  void onNewsTileTap(NewsArticle article) {
    context.push('/news/details', extra: article);
  }

  Future<void> _loadArticles() async {
    try {
      _newsArticles.loading();
      final articles = await model.getArticles();
      if (articles != null && articles.isNotEmpty) {
        _newsArticles.content(articles);
      } else {
        _newsArticles.content([]);
      }
    } on Exception catch (err) {
      _newsArticles.error(err);
    }
  }
}

NewsFeedWM createNewsFeedWM(BuildContext _) => NewsFeedWM(
      NewsFeedModel(
        NewsService(),
      ),
    );
