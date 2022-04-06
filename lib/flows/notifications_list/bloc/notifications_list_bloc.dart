import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:injectable/injectable.dart';

import '../../../interactors/news/abstract_news_interactor.dart';

part 'notifications_list_state.dart';

@singleton
class NotificationsListBloc extends Cubit<NotificationsListState> {
  NotificationsListBloc({required this.newsInteractor})
      : super(NotificationsListState.initial()) {
    loadArticles();
  }

  final AbstractUsersInteractor newsInteractor;

  Future loadArticles() async {
    var featuredArticles = await newsInteractor.getFeaturedArticles();
    var latestArticles = await newsInteractor.getLatestArticles();
    emit(state.copyWith(
      featuredArticles: featuredArticles,
      latestArticles: latestArticles,
    ));
  }

  Future markAsRead(
    String id,
  ) async {
    var latestNewsList = state.latestArticles;
    var index = latestNewsList.indexWhere((element) => element.id == id);
    latestNewsList.elementAt(index).readed = true;
    emit(state.copyWith(latestArticles: latestNewsList));
  }

  Future markAllAsRead() async {
    var latestNewsList = state.latestArticles;
    for (var element in latestNewsList) {
      element.readed = true;
    }
    emit(state.copyWith(latestArticles: latestNewsList));
  }

  Future saveCurrentFeaturedIndex(int index) async {
    emit(state.copyWith(index: index));
  }
}
