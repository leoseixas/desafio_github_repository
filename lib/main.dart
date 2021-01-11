import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Repositories',
      theme: ThemeData(
        // primaryColor: Colors.grey[850],
        primaryColor: Colors.blueAccent[200],
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white70,
      ),
      home: HomeScreen(),
    );
  }
}
