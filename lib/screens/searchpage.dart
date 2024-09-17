import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SearchArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "학술 보고서 검색",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "NanumBarunGothic",
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(19, 30, 73, 0.9),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Center(
        child: Text(args.searchBy),
      ),
    );
  }
}

class SearchArguments {
  final String searchBy;
  SearchArguments({required this.searchBy});
}
