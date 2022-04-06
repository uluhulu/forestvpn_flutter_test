import 'package:flutter/material.dart';
import 'package:forestvpn_test/flows/notifications_list/notifications_list_page.dart';

void main() {
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const NotificationListPage());
  }
}
