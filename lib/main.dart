import 'package:haksul/db.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:haksul/screens/homepage.dart';
import 'package:haksul/screens/directions.dart';
import 'package:haksul/screens/searchpage.dart';
import 'package:haksul/screens/schoolstructure.dart';

Future<void> main() async {
  await MongoDatabase.connect();
  runApp(const MyApp());
}

GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (context, state) => const HaksulHomePage(),
      routes: <RouteBase>[
        GoRoute(
          path: "/search",
          builder: (context, state) {
            return const SearchPage();
          },
        ),
        GoRoute(
          path: "/directions",
          builder: (context, state) => const DirectionsPage(),
        ),
        GoRoute(
          path: "/schoolstructure",
          builder: (context, state) => const SchoolStructurePage(),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MongoDatabase.connect();

    return MaterialApp.router(
      title: '2024 경희고등학교 학술제',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        primaryColor: const Color(0xFF193073),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
