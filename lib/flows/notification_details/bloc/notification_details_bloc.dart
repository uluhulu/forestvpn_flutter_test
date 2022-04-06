import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/flows/notification_details/bloc/notification_details_state.dart';
import 'package:forestvpn_test/interactors/news/abstract_news_interactor.dart';
import 'package:forestvpn_test/utils/app_notifier.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationDetailsBloc extends Cubit<NotificationDetailsState> {
  NotificationDetailsBloc(
    this.newsInteractor,
  ) : super(NotificationDetailsState.initial());
  final AbstractUsersInteractor newsInteractor;

  Future getArticle(String id) async {
    try {
      var article = await newsInteractor.getArticle(id);
      emit(
        state.copyWith(article: article),
      );
    } on StateError catch (e) {
      showMessage(
        message: e.message,
      );
    }
  }
}
