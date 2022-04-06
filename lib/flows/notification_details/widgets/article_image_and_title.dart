import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forestvpn_test/config/resources.dart';
import 'package:forestvpn_test/config/styles.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/widgets/image_with_shimmer.dart';

class ArticleImageAndTitle extends StatelessWidget {
  final Article article;

  const ArticleImageAndTitle({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: ImageWithShimmer(
              imageUrl: article.imageUrl,
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)),
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
                        left: 48.w,
                        bottom: 40.h,
                      ),
                      child: Text(
                        article.title,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.headline1White28,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 58.h,
            left: 16.w,
            child: CupertinoButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                Resources.arrowBackIcon,
              ),
            ),
          )
        ],
      ),
    );
  }
}
