import 'package:flutter/material.dart';
import 'package:forestvpn_test/config/styles.dart';

class CustomTitle extends StatelessWidget {
  final String title;

  const CustomTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
      child: Text(
        title,
        style: AppTextStyles.headline2Black20,
      ),
    );
  }
}
