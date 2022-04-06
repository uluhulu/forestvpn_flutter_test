import 'package:forestvpn_test/repositories/news/repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AbstractNewsRepository)
class MockNewsRepository implements AbstractNewsRepository {
  @override
  Future<List<Article>> getLatestArticles() async {
    return _mockArticles;
  }

  /// Can throw [StateError]
  @override
  Future<Article> getArticle(String id) async {
    var article = _mockArticles.firstWhere((e) => e.id == id);
    if (article != null) {
      return _mockArticles.firstWhere((e) => e.id == id);
    }
    throw StateError("Can't load article");
  }

  @override
  Future<List<Article>> getFeaturedArticles() async {
    return _mockArticles;
  }
}

final _mockArticles = [
  Article(
    id: '1108389a-b3db-11ec-b909-0242ac120002',
    title: 'We are processing your request...',
    publicationDate: DateTime.now().subtract(const Duration(days: 1)),
    imageUrl:
        'https://i.guim.co.uk/img/media/6088d89032f8673c3473567a91157080840a7bb8/413_955_2808_1685/master/2808.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=412cc526a799b2d3fff991129cb8f030',
    description: '''Please excuse the interruption.  
Due to Google's efforts to maintain a “safe ads ecosystem” for its advertisers, publishers and users from fraud and bad experiences, Google has placed restrictions on our ad serving that limit our ability to provide free VPN services. 
Regrettably, this is beyond our control.  
To continue to enjoy ForestVPN without interruptions, please upgrade to our Premium version.''',
  ),
  Article(
    id: '0e8dba30-b3dc-11ec-b909-0242ac120002',
    title: 'What is Lorem Ipsum...',
    publicationDate: DateTime.now().subtract(const Duration(days: 2)),
    imageUrl: 'https://cloudspoint.xyz/wp-content/uploads/2020/02/CODE-1.jpg',
    description:
        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
  ),
  Article(
    id: '787fa7fa-b3dc-11ec-b909-0242ac120002',
    title: 'Why do we use it...',
    publicationDate: DateTime.now().subtract(const Duration(days: 2, hours: 4)),
    imageUrl:
        "https://imageio.forbes.com/specials-images/imageserve/5f285681289af0e7316b841b/The-Milky-Way-in-all-of-its-glory-over-Two-Jack-Lake-in-Banff-National-Park--Alberta/960x0.jpg?fit=bounds&format=jpg&width=960",
    description:
        '''It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).''',
  ),
  Article(
    id: 'b818ca9a-b3dc-11ec-b909-0242ac120002',
    title: 'Where does it come from...',
    publicationDate: DateTime.now().subtract(const Duration(days: 3, hours: 5)),
    imageUrl:
        'https://www.futureconceptretail.com/wp-content/uploads/2020/01/Design-Thinking-1.jpg',
    description:
        '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
  ),
  Article(
    id: 'b818ca9a-b3dc-11ec-b909-0242ac120002',
    title: 'Where does it come from...',
    publicationDate: DateTime.now().subtract(const Duration(days: 3, hours: 5)),
    imageUrl:
        'https://www.futureconceptretail.com/wp-content/uploads/2020/01/Design-Thinking-1.jpg',
    description:
        '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
  ),
];
