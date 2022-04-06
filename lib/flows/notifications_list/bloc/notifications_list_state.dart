part of 'notifications_list_bloc.dart';

class NotificationsListState {
  final List<Article> featuredArticles;
  final List<Article> latestArticles;
  final int index;

  NotificationsListState.initial()
      : featuredArticles = [],
        latestArticles = [],
        index = 0;

  NotificationsListState({
    required this.featuredArticles,
    required this.latestArticles,
    required this.index,
  });

  NotificationsListState copyWith({
    List<Article>? featuredArticles,
    List<Article>? latestArticles,
    int? index,
  }) {
    return NotificationsListState(
      featuredArticles: featuredArticles ?? this.featuredArticles,
      latestArticles: latestArticles ?? this.latestArticles,
      index: index ?? this.index,
    );
  }
}

