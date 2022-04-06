import 'package:forestvpn_test/interactors/news/abstract_news_interactor.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:injectable/injectable.dart';

import '../../repositories/news/abstract_news_repository.dart';

@Singleton(as: AbstractUsersInteractor)
class DefaultNewsInteractor extends AbstractUsersInteractor {
  final AbstractNewsRepository abstractNewsRepository;

  DefaultNewsInteractor({required this.abstractNewsRepository});

  @override
  Future<Article> getArticle(String id) {
    return abstractNewsRepository.getArticle(id);
  }

  @override
  Future<List<Article>> getFeaturedArticles() {
    return abstractNewsRepository.getFeaturedArticles();
  }

  @override
  Future<List<Article>> getLatestArticles() {
    return abstractNewsRepository.getLatestArticles();
  }
}
