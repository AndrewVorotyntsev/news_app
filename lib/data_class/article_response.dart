import 'package:json_annotation/json_annotation.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  final String? author;

  final String? title;

  final String? description;

  final String? url;

  final String? urlToImage;

  const ArticleResponse({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}
