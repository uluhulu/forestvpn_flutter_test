part of 'notifications_list_bloc.dart';

class NotificationsListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadArticlesEvent extends NotificationsListEvent {}

class MarkArticleAsReadEvent extends NotificationsListEvent {
  final String id;

  MarkArticleAsReadEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class MarkAllArticlesAsReadEvent extends NotificationsListEvent {}

class SaveIndexEvent extends NotificationsListEvent {
  final int index;

  SaveIndexEvent({
    required this.index,
  });

  @override
  List<Object?> get props => [index];
}
