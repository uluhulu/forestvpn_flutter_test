import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/config/app_string.dart';
import 'package:forestvpn_test/flows/notifications_list/widgets/featured_list_widgets/featured_article_item.dart';
import 'package:forestvpn_test/flows/notifications_list/widgets/latest_list_widgets/latest_list_item.dart';
import 'package:forestvpn_test/flows/notifications_list/widgets/title.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

class FeaturesHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<Article> articlesList;

  FeaturesHeaderDelegate({required this.articlesList});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = min(1, shrinkOffset / (maxExtent - minExtent)).toDouble();
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: progress,
          child: Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: LatestNewsListItem(
              article: articlesList[0],
            ),
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: 1 - progress,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTitle(title: AppString.featured),
              Expanded(
                child: ListView.builder(
                  itemCount: articlesList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return FeaturedArticleItem(
                      article: articlesList[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 400.h;

  @override
  // TODO: implement minExtent
  double get minExtent => 145.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
