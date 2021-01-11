import 'package:desafio_git_repository/model/repository.dart';
import 'package:dio/dio.dart';

class RepositorioGitRepository {
  Dio dio;

  final url = 'https://api.github.com/repositories';

  RepositorioGitRepository({Dio dio}) : this.dio = dio ?? Dio();

  Future<List<Repository>> fetchRepositories() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((map) => Repository.fromJson(map)).toList();
  }
}
