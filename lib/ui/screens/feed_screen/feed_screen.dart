import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/news_article.dart';
import 'package:news_app/ui/screens/feed_screen/feed_screen_wm.dart';

class NewsFeedScreen extends ElementaryWidget<NewsFeedWM> {
  const NewsFeedScreen({
    Key? key,
    WidgetModelFactory wmFactory = createNewsFeedWM,
  }) : super(
          wmFactory,
          key: key,
        );

  @override
  Widget build(NewsFeedWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новости'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: EntityStateNotifierBuilder<List<NewsArticle>>(
              listenableEntityState: wm.newsArticles,
              errorBuilder: (_, __, ___) {
                return Center(
                  child: Container(
                    color: Colors.red,
                    height: 50,
                    width: 50,
                  ),
                );
              },
              loadingBuilder: (_, __) {
                return const Center(child:  CircularProgressIndicator(),);
              },
              builder: (_, data) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final article in data!)
                        ListTile(
                          leading: article.iconUrl != null
                              ? Image.network(article.iconUrl!)
                              : const Icon(Icons.newspaper),
                          title: Text(article.title),
                          subtitle: Text(article.author ?? 'Аноним'),
                          onTap: () => wm.onNewsTileTap(article),
                        )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
