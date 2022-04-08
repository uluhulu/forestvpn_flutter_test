import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:injectable/injectable.dart';

import '../../../interactors/news/abstract_news_interactor.dart';
import 'package:equatable/equatable.dart';

part 'notifications_list_state.dart';

part 'notifications_list_event.dart';

@singleton
class NotificationsListBloc
    extends Bloc<NotificationsListEvent, NotificationsListState> {
  NotificationsListBloc({required this.newsInteractor})
      : super(NotificationsListState.initial()) {
    on<LoadArticlesEvent>(_loadArticles);
    on<MarkArticleAsReadEvent>(_markAsRead);
    on<MarkAllArticlesAsReadEvent>(_markAllAsRead);
    on<SaveIndexEvent>(_saveCurrentFeaturedIndex);
  }

  final AbstractUsersInteractor newsInteractor;

  void _loadArticles(
      NotificationsListEvent event,
      Emitter<NotificationsListState> emit,
      ) async {
    var featuredArticles = await newsInteractor.getFeaturedArticles();
    var latestArticles = await newsInteractor.getLatestArticles();
    emit(state.copyWith(
      featuredArticles: featuredArticles,
      latestArticles: latestArticles,
    ));
  }

  void _markAsRead(
      MarkArticleAsReadEvent event,
      Emitter<NotificationsListState> emit,
      ) async {
    var latestNewsList = List<Article>.from(state.latestArticles);

    var index = latestNewsList.indexWhere((element) => element.id == event.id);
    latestNewsList[index] = latestNewsList[index].copyWith(readed: true);

    emit(
      state.copyWith(
        latestArticles: latestNewsList,
      ),
    );
  }

  void _markAllAsRead(
      MarkAllArticlesAsReadEvent event,
      Emitter<NotificationsListState> emit,
      ) async {
    var latestNewsList = List<Article>.from(state.latestArticles);

    for (int i = 0; i < latestNewsList.length; i++) {
      latestNewsList[i] = latestNewsList[i].copyWith(readed: true);
    }

    emit(state.copyWith(latestArticles: latestNewsList));
  }

  void _saveCurrentFeaturedIndex(
      SaveIndexEvent event,
      Emitter<NotificationsListState> emit,
      ) async {
    emit(state.copyWith(index: event.index));
  }
}