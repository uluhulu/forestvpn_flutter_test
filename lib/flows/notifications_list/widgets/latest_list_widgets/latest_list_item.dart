import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/config/styles.dart';
import 'package:forestvpn_test/flows/notification_details/notification_details_page.dart';
import 'package:forestvpn_test/flows/notifications_list/bloc/notifications_list_bloc.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/utils/weekday_returner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forestvpn_test/widgets/image_with_shimmer.dart';

class LatestNewsListItem extends StatelessWidget {
  final Article article;

  const LatestNewsListItem({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NotificationsListBloc>(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 28.w,
        right: 28.w,
        bottom: 20.h,
      ),
      child: GestureDetector(
        onTap: () {
          cubit.markAsRead(article.id);
          navigateToNotificationDetailsScreen(context);
        },
        child: Container(
            decoration: BoxDecoration(
              color: article.readed ? const Color(0xfff5f5f5) : Colors.white,
              boxShadow: [
                if (!article.readed)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(4, 4),
                  ),
                if (article.readed)
                  const BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 20,
                    offset: Offset(4, 4),
                  ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(9)),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                bottom: 20.h,
                left: 20.w,
                right: 35.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: SizedBox(
                      width: 90.w,
                      height: 60.h,
                      child: ImageWithShimmer(
                        imageUrl: article.imageUrl,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 23.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 190.w,
                        child: Text(
                          article.title,
                          style: AppTextStyles.bodyText1Black16,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      SizedBox(
                        width: 190.w,
                        child: Text(
                          weekdayReturner(article.publicationDate),
                          style: AppTextStyles.bodyText2Grey12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
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
