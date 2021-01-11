import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'images/github_logo.png',
          width: 30,
        ),
        SizedBox(
          width: 15,
        ),
        Image.asset(
          'images/github_title.png',
          width: 60,
        ),
      ],
    );
  }
}
