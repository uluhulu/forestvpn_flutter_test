import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/flows/notifications_list/notification_list_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationListPage extends StatelessWidget {
  const NotificationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        designSize: const Size(414, 896),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);

    return NotificationListForm();
  }
}
