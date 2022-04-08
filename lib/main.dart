import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/flows/notifications_list/bloc/notifications_list_bloc.dart';
import 'package:forestvpn_test/flows/notifications_list/notifications_list_page.dart';
import 'package:forestvpn_test/injectable/injectable_init.dart';
import 'package:forestvpn_test/utils/app_notifier.dart';
import 'package:get_it/get_it.dart';

void main() {
  configureDependencies();
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotificationsListBloc>(
          create: (context) {
            final bloc = GetIt.instance.get<NotificationsListBloc>();
            bloc.add(LoadArticlesEvent());
            return bloc;
          },
        )
      ],
      child: MaterialApp(
          scaffoldMessengerKey: snackbarKey,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const NotificationListPage()),
    );
  }
}
