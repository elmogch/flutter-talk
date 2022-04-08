import 'package:flutter/material.dart';

import './controllers/home_controller.dart';
import './controllers/detail_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Alternativa Multiplataforma',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeController(),
      routes: {
        DetailController.routeName: (context) => DetailController(),
      },
    );
  }
}
