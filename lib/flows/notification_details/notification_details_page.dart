import 'package:flutter/material.dart';
import 'package:forestvpn_test/config/styles.dart';
import 'package:forestvpn_test/flows/notification_details/widgets/article_details_header_delegate.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationDetailsPage extends StatelessWidget {
  final Article article;

  const NotificationDetailsPage({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: ArticleDetailsHeaderDelegate(
              article: article,
            ),
          ),
           SliverToBoxAdapter(
           child:  SizedBox(
              height: 20.h,
            ),
         ),
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 21.w),
              child: Text(
                article.description ?? '',
                style: AppTextStyles.bodyText1Black16,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
