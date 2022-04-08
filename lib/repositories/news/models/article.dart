import 'package:equatable/equatable.dart';

class Article {
  Article({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
    this.readed = false,
    this.description,
  });

  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  bool readed;
  final String? description;

  @override
  String toString() {
    return 'Article{id: $id, title: $title, publicationDate: $publicationDate, imageUrl: $imageUrl, readed: $readed, description: $description}';
  }
}
