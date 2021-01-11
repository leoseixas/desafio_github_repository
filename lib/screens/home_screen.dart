import 'package:desafio_git_repository/controllers/repository_controller.dart';
import 'package:flutter/material.dart';

import 'components/repository_card.dart';
import 'components/title_appbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = RepositoryController();

  _start() {
    return Container();
  }

  _loading() {
    return Center(
      child: Container(
        height: 70,
        width: 70,
        child: CircularProgressIndicator(),
      ),
    );
  }

  _success() {
    return Scaffold(
      // body: ListView.builder(
      //   itemBuilder: (context, index) {
      //     var repository = controller.repositories[index];

      //     return RepositoryCard(repository);
      //   },
      //   itemCount: controller.repositories.length ?? 0,
      // ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2.0,
          childAspectRatio: 0.95,
          crossAxisSpacing: 2.0,
        ),
        itemBuilder: (context, index) {
          var repository = controller.repositories[index];
          return RepositoryCard(repository);
        },
        itemCount: controller.repositories.length ?? 0,
      ),
    );
  }

  _error() {
    return Center(
      child: Container(
        height: 350,
        width: 350,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/error.png',
                height: 75,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Erro ao carregar dados',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.red[800],
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RaisedButton(
                onPressed: () {
                  controller.start();
                },
                child: Text("Tente novamente"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  stateManagement(RepositoryState state) {
    switch (state) {
      case RepositoryState.start:
        return _start();
      case RepositoryState.loading:
        return _loading();
      case RepositoryState.success:
        return _success();
      case RepositoryState.error:
        return _error();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              controller.start();
            },
          )
        ],
      ),
      body: AnimatedBuilder(
          animation: controller.state,
          builder: (_, __) {
            return stateManagement(controller.state.value);
          }),
    );
  }
}
