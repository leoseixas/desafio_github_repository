import 'package:desafio_git_repository/model/repository.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryCard extends StatelessWidget {
  final Repository repository;

  RepositoryCard(this.repository);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _openBrowser(repository.urlRepository);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  repository.avatar,
                  height: 100,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      repository.nameRepository,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      repository.nameUser,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _openBrowser(String repositoryUrl) async {
    String url = repositoryUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not lauch $url';
    }
  }
}
