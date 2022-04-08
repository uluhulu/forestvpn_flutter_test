part of 'notifications_list_bloc.dart';

class NotificationsListState extends Equatable{
  final List<Article> latestArticles;
  final List<Article> featuredArticles;
  final int index;

  NotificationsListState.initial()
      : latestArticles = [],
        featuredArticles = [],
        index = 0;

  const NotificationsListState({
    required this.latestArticles,
    required this.featuredArticles,
    required this.index,
  });

  NotificationsListState copyWith({
    List<Article>? latestArticles,
    List<Article>? featuredArticles,
    int? index,
  }) {
    return NotificationsListState(
      index: index ?? this.index,
      featuredArticles: featuredArticles ?? this.featuredArticles,
      latestArticles: latestArticles ?? this.latestArticles,
    );
  }

  @override
  List<Object?> get props => [
    latestArticles,
    featuredArticles,
    index,
      ];
}
