import 'package:flutter/material.dart';
import 'package:farmverse/pages/list.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AnimalsList(),
      theme: ThemeData(
          primaryColor: Colors.amber,
          tabBarTheme: const TabBarTheme(
            labelColor: Colors.black87, // color for text
          ),
          primarySwatch: Colors.green),
    );
  }
}
