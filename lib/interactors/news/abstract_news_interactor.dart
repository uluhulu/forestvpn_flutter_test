
import '../../repositories/news/models/article.dart';

abstract class AbstractUsersInteractor {
  Future<List<Article>> getLatestArticles();
  Future<List<Article>> getFeaturedArticles();
  Future<Article> getArticle(String id);
}