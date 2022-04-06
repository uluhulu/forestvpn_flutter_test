import 'package:flutter/material.dart';
import 'package:forestvpn_test/config/styles.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

enum NotifyType {
  success,
  error,
}

void showMessage({
  required String message,
}) {
  final SnackBar snackBar = SnackBar(
    content: Text(
      message,
      style: AppTextStyles.headline1White28.copyWith(),
    ),
    backgroundColor: Colors.red,
  );
  snackbarKey.currentState?.showSnackBar(snackBar);
}
