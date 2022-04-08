import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forestvpn_test/config/resources.dart';
import 'package:forestvpn_test/config/styles.dart';
import 'package:forestvpn_test/flows/notifications_list/bloc/notifications_list_bloc.dart';
import 'package:forestvpn_test/flows/notifications_list/widgets/featured_list_widgets/features_header_delegate.dart';
import 'package:forestvpn_test/flows/notifications_list/widgets/latest_list_widgets/latest_news_list.dart';
import 'package:forestvpn_test/flows/notifications_list/widgets/title.dart';

import '../../config/app_string.dart';

class NotificationListForm extends StatelessWidget {
   const NotificationListForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsListBloc, NotificationsListState>(
      builder: (context, state) {
        print("ass");
        var bloc = BlocProvider.of<NotificationsListBloc>(context);
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  AppString.notifications,
                  style: AppTextStyles.headline3Black18,
                ),
                leading: CupertinoButton(
                  child: SvgPicture.asset(
                    Resources.arrowBackIcon,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                actions: [
                  CupertinoButton(
                    child: Text(
                      AppString.markAllRead,
                      style: AppTextStyles.headline3Black18,
                    ),
                    onPressed: () {
                      bloc.add(MarkAllArticlesAsReadEvent());
                    },
                  ),
                ],
              ),
              body: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    pinned: false,
                    delegate: FeaturesHeaderDelegate(
                      articlesList: state.featuredArticles,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: CustomTitle(
                      title: AppString.latestNews,
                    ),
                  ),
                  LatestNewsList(
                    articlesList: state.latestArticles,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
