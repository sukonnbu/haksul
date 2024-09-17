import 'package:flutter/material.dart';
import 'package:haksul/screens/homepage.dart';
import 'package:haksul/screens/searchpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2024 경희고등학교 학술제',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      home: const HaksulHomePage(),
      routes: {
        "/search": (context) => const SearchPage(),
      },
    );
  }
}
