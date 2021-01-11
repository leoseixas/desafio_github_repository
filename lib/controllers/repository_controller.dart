import 'package:desafio_git_repository/model/repository.dart';
import 'package:desafio_git_repository/repositories/repositorio_git_repository.dart';
import 'package:flutter/cupertino.dart';

class RepositoryController {
  List<Repository> repositories = [];
  final RepositorioGitRepository _repositorioGitRepository;
  final state = ValueNotifier<RepositoryState>(RepositoryState.start);

  RepositoryController([RepositorioGitRepository repositorioGitRepository])
      : _repositorioGitRepository =
            repositorioGitRepository ?? RepositorioGitRepository();

  Future start() async {
    state.value = RepositoryState.loading;
    try {
      repositories = await _repositorioGitRepository.fetchRepositories();
      state.value = RepositoryState.success;
    } catch (_) {
      state.value = RepositoryState.error;
    }
  }
}

enum RepositoryState { start, loading, success, error }
