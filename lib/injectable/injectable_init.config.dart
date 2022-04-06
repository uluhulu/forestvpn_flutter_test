// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../flows/notification_details/bloc/notification_details_bloc.dart'
    as _i8;
import '../flows/notifications_list/bloc/notifications_list_bloc.dart' as _i9;
import '../interactors/news/abstract_news_interactor.dart' as _i5;
import '../interactors/news/default_news_interactor.dart' as _i6;
import '../repositories/news/abstract_news_repository.dart' as _i7;
import '../repositories/news/mock_news_repository.dart' as _i4;
import '../repositories/news/repository.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AbstractNewsRepository>(_i4.MockNewsRepository());
  gh.singleton<_i5.AbstractUsersInteractor>(_i6.DefaultNewsInteractor(
      abstractNewsRepository: get<_i7.AbstractNewsRepository>()));
  gh.factory<_i8.NotificationDetailsBloc>(
      () => _i8.NotificationDetailsBloc(get<_i5.AbstractUsersInteractor>()));
  gh.singleton<_i9.NotificationsListBloc>(_i9.NotificationsListBloc(
      newsInteractor: get<_i5.AbstractUsersInteractor>()));
  return get;
}
