import 'package:flutter/material.dart';
import 'package:forestvpn_test/flows/notifications_list/widgets/latest_list_widgets/latest_list_item.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

class LatestNewsList extends StatelessWidget {
  final List<Article> articlesList;
  const LatestNewsList({Key? key, required this.articlesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return LatestNewsListItem(
            article: articlesList[index],
          );
        },
        childCount: articlesList.length,
      ),
    );
  }
}
