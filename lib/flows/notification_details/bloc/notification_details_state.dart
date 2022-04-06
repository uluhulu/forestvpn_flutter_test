import '../../../repositories/news/models/article.dart';

class NotificationDetailsState {
  final Article article;

  NotificationDetailsState.initial()
      : article = Article(
          id: "",
          title: "",
          publicationDate: DateTime.now(),
          imageUrl: "",
        );

  NotificationDetailsState({required this.article});

  NotificationDetailsState copyWith({
    Article? article,
  }) {
    return NotificationDetailsState(
      article: article ?? this.article,
    );
  }
}
