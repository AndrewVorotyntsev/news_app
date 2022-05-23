class NewsArticle {
  final String title;
  final String url;
  final String? author;
  final String? description;
  final String? iconUrl;
  final String? urlToImage;

  const NewsArticle({
    required this.title,
    required this.url,
    this.author,
    this.description,
    this.iconUrl,
    this.urlToImage,
  });
}
