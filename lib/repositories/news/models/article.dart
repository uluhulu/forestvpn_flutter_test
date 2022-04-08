
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
  final bool readed;
  final String? description;

  @override
  String toString() {
    return 'Article{id: $id, title: $title, publicationDate: $publicationDate, imageUrl: $imageUrl, readed: $readed, description: $description}';
  }

  Article copyWith({
    String? id,
    String? title,
    DateTime? publicationDate,
    String? imageUrl,
    bool? readed,
    String? description,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      publicationDate: publicationDate ?? this.publicationDate,
      imageUrl: imageUrl ?? this.imageUrl,
      readed: readed ?? this.readed,
      description: description ?? this.description,
    );
  }
}
