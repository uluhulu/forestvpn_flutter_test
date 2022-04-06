import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/config/styles.dart';
import 'package:forestvpn_test/flows/notification_details/bloc/notification_details_bloc.dart';
import 'package:forestvpn_test/flows/notification_details/bloc/notification_details_state.dart';
import 'package:forestvpn_test/flows/notification_details/widgets/article_details_header_delegate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationDetailsForm extends StatelessWidget {
  const NotificationDetailsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NotificationDetailsBloc, NotificationDetailsState>(
        builder: (context, state) => CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: ArticleDetailsHeaderDelegate(
                article: state.article,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.w),
                child: Text(
                  state.article.description ?? '',
                  style: AppTextStyles.bodyText1Black16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
