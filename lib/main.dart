import 'package:flutter/material.dart';
import 'package:module_3_movies_app/pages/home_page.dart';
import 'package:module_3_movies_app/pages/movies_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MovieDetailPage(),
    );
  }
}


