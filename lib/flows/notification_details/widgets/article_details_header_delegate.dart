import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forestvpn_test/flows/notification_details/widgets/article_image_and_title.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

class ArticleDetailsHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Article article;

  ArticleDetailsHeaderDelegate({required this.article});

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
            child: Container(
              color: Colors.blue,
            )),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: 1 - progress,
          child: ArticleImageAndTitle(article: article),
        ),
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 430;

  @override
  // TODO: implement minExtent
  double get minExtent => 130;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
