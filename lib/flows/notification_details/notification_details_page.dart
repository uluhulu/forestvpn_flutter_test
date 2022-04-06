import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/flows/notification_details/bloc/notification_details_bloc.dart';
import 'package:forestvpn_test/flows/notification_details/notification_details_form.dart';
import 'package:get_it/get_it.dart';

class NotificationDetailsPage extends StatelessWidget {
  final String id;

  const NotificationDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationDetailsBloc>(
      create: (context) =>
          GetIt.instance.get<NotificationDetailsBloc>()..getArticle(id),
      child: const NotificationDetailsForm(),
    );
  }
}
