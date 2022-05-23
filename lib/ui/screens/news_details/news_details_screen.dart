import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/news_article.dart';
import 'package:news_app/ui/screens/news_details/news_details_wm.dart';

class NewsDetailsScreen extends ElementaryWidget<NewsDetailsWM> {
  NewsDetailsScreen({
    Key? key,
    required NewsArticle article,
  }) : super(
          (context) => createNewsDetailsWM(
            context,
            article,
          ),
          key: key,
        );

  @override
  Widget build(NewsDetailsWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новости'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              wm.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            if (wm.urlToImage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Image.network(wm.urlToImage!),
              ),
            if (wm.description != null)
              Text(
                wm.description!,
                style: TextStyle(fontSize: 16),
              ),
            SizedBox(
              height: 16,
            ),
            if (wm.author != null) Text("Автор: ${wm.author}"),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Text("Источник: ${wm.url}"),
              onTap: wm.goLink,
            )
          ],
        ),
      ),
    );
  }
}
