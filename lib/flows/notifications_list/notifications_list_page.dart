import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forestvpn_test/config/resources.dart';
import 'package:forestvpn_test/config/styles.dart';
import 'package:forestvpn_test/flows/notifications_list/widgets/featured_list_widgets/features_header_delegate.dart';
import 'package:forestvpn_test/flows/notifications_list/widgets/latest_list_widgets/latest_list_item.dart';
import 'package:forestvpn_test/flows/notifications_list/widgets/title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_string.dart';
import '../../repositories/news/models/article.dart';

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
                  onPressed: () {},
                ),
              ],
            ),
            body: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: false,
                  delegate: FeaturesHeaderDelegate(
                    articlesList: _mockArticles,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: CustomTitle(
                    title: AppString.latestNews,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return LatestNewsListItem(
                        article: _mockArticles[index],
                      );
                    },
                    childCount: _mockArticles.length,
                  ),
                )
              ],
            )),
      ),
    );
  }

  static const String url =
      "https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg";
  static final List<Article> _mockArticles = [
    Article(
      id: '1108389a-b3db-11ec-b909-0242ac120002',
      title: 'We are processing your request...',
      publicationDate: DateTime.now().subtract(const Duration(days: 1)),
      imageUrl: url,
      description: '''Please excuse the interruption.  
Due to Google's efforts to maintain a “safe ads ecosystem” for its advertisers, publishers and users from fraud and bad experiences, Google has placed restrictions on our ad serving that limit our ability to provide free VPN services. 
Regrettably, this is beyond our control.  
To continue to enjoy ForestVPN without interruptions, please upgrade to our Premium version.''',
    ),
    Article(
      id: '0e8dba30-b3dc-11ec-b909-0242ac120002',
      title: 'What is Lorem Ipsum...',
      publicationDate: DateTime.now().subtract(const Duration(days: 2)),
      imageUrl: url,
      description:
          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
    ),
    Article(
      id: '787fa7fa-b3dc-11ec-b909-0242ac120002',
      title: 'Why do we use it...',
      publicationDate:
          DateTime.now().subtract(const Duration(days: 2, hours: 4)),
      imageUrl: url,
      description:
          '''It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).''',
    ),
    Article(
      id: 'b818ca9a-b3dc-11ec-b909-0242ac120002',
      title: 'Where does it come from...',
      publicationDate:
          DateTime.now().subtract(const Duration(days: 3, hours: 5)),
      imageUrl: url,
      description:
          '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
    ),
    Article(
      id: 'b818ca9a-b3dc-11ec-b909-0242ac120002',
      title: 'Where does it come from...',
      publicationDate:
          DateTime.now().subtract(const Duration(days: 3, hours: 5)),
      imageUrl: url,
      description:
          '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
    ),
    Article(
      id: 'b818ca9a-b3dc-11ec-b909-0242ac120002',
      title: 'Where does it come from...',
      publicationDate:
          DateTime.now().subtract(const Duration(days: 3, hours: 5)),
      imageUrl: url,
      description:
          '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
    ),
    Article(
      id: 'b818ca9a-b3dc-11ec-b909-0242ac120002',
      title: 'Where does it come from...',
      publicationDate:
          DateTime.now().subtract(const Duration(days: 3, hours: 5)),
      imageUrl: url,
      description:
          '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
    ),
    Article(
      id: 'b818ca9a-b3dc-11ec-b909-0242ac120002',
      title: 'Where does it come from...',
      publicationDate:
          DateTime.now().subtract(const Duration(days: 3, hours: 5)),
      imageUrl: url,
      description:
          '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
    ),
    Article(
      id: 'b818ca9a-b3dc-11ec-b909-0242ac120002',
      title: 'Where does it come from...',
      publicationDate:
          DateTime.now().subtract(const Duration(days: 3, hours: 5)),
      imageUrl: url,
      description:
          '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
    ),
  ];
}
