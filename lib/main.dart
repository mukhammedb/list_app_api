import 'package:flutter/material.dart';
import 'package:list_app_api/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food recipe',
      theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          textTheme:
              const TextTheme(bodyText2: TextStyle(color: Colors.white))),
      home: const HomePage(),
    );
  }
}
