import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/config/styles.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/widgets/image_with_shimmer.dart';

import '../../../notification_details/notification_details_page.dart';

class FeaturedArticleItem extends StatelessWidget {
  final Article article;

  const FeaturedArticleItem({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: GestureDetector(
        onTap: () {
          navigateToNotificationDetailsScreen(context);
        },
        child: SizedBox(
          width: 358.w,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: ImageWithShimmer(
                  imageUrl: article.imageUrl,
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                        width: 270.w,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            bottom: 40.h,
                          ),
                          child: Text(
                            article.title,
                            style: AppTextStyles.headline1White28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToNotificationDetailsScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => NotificationDetailsPage(
              id: article.id,
            )));
  }
}
