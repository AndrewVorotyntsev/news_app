import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:news_app/data_class/article_response.dart';
import 'package:news_app/domain/news_article.dart';
import 'package:news_app/mappers/news_mappers.dart';

class NewsService {
  static const _baseUrl = 'https://newsapi.org';

  final dio = Dio(BaseOptions(baseUrl: _baseUrl));

  Future<List<NewsArticle>?> getArticles() async {
    bool isNetUsing = false;
    final rawArticles =  isNetUsing ? await _getFreshArticles() : await _getAssetArticles();
    if (rawArticles != null) {
      final mappedArticles = mapNewsArticles(rawArticles);
      return mappedArticles;
    }
    return null;
  }

  // TODO: разнести по репозиториям

  Future<List<ArticleResponse>?> _getFreshArticles() async {
    final articlesResponse =
    await dio.get<String>('/v2/top-headlines?country=ru&apiKey=$_apiKey');

    final bodyJson =
    jsonDecode(articlesResponse.data ?? '') as Map<String, dynamic>;

    final articlesJson = bodyJson['articles'] as List;

    return [
      for (final article in articlesJson)
        ArticleResponse.fromJson(article as Map<String, dynamic>),
    ];
  }

  // Получить захардкоженные новости новости, чтобы каждый раз не делать запросы в сеть
  Future<List<ArticleResponse>?> _getAssetArticles() async {
    String data = await rootBundle.loadString('assets/json/news290422.json');
    final jsonResult = json.decode(data);

    final articlesJson = jsonResult['articles'] as List;

    return [
      for (final article in articlesJson)
        ArticleResponse.fromJson(article as Map<String, dynamic>),
    ];
  }
}
