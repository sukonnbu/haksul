import 'package:flutter/material.dart';
import 'package:haksul/components.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SearchArguments;

    return Scaffold(
      appBar: commonAppBar("학술 보고서 검색"),
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
