import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/domain/news_article.dart';
import 'package:news_app/ui/screens/feed_screen/feed_screen.dart';
import 'package:news_app/ui/screens/news_details/news_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      );

  final _router = GoRouter(
    initialLocation: '/news',
    routes: [
      GoRoute(
        path: '/news',
        builder: (context, state) => const NewsFeedScreen(),
      ),
      GoRoute(
        path: '/news/details',
        builder: (context, state) =>
            NewsDetailsScreen(article: state.extra as NewsArticle),
      ),
    ],
  );
}
