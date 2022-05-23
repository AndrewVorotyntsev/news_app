import 'package:favicon/favicon.dart';
import 'package:news_app/data_class/article_response.dart';
import 'package:news_app/domain/news_article.dart';

List<NewsArticle> mapNewsArticles(List<ArticleResponse> articleResponse) {
  List<NewsArticle> mapped = [];
  for (final article in articleResponse) {
    final mappedArticle = mapNewsArticle(article);
    if (mappedArticle != null) {
      mapped.add(mappedArticle);
    }
  }
  return mapped;
}


NewsArticle? mapNewsArticle(ArticleResponse articleResponse) {
  if (articleResponse.title != null && articleResponse.url != null) {
   // final icon = await Favicon.getBest(articleResponse.url!);

    return NewsArticle(
      title: articleResponse.title!,
      url: articleResponse.url!,
      urlToImage: articleResponse.urlToImage,
      author: articleResponse.author,
      description: articleResponse.description,
      //iconUrl: icon?.url,
    );
  }
  return null;
}
