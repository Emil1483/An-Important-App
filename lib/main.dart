import 'package:flutter/material.dart';

import './routes/home_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'An Important App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        textTheme: TextTheme(
          headline: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 32.0,
          ),
          button: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: HomeRoute(),
    );
  }
}
