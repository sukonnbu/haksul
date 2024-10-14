import 'package:flutter/material.dart';
import 'package:haksul/components.dart';

final List<String> searchByList = <String>["사람", "주제", "장소"];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchByValue = searchByList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar("학술 보고서 검색"),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              DropdownButton<String>(
                value: searchByValue,
                onChanged: (String? newValue) {
                  setState(() {
                    searchByValue = newValue!;
                  });
                },
                items:
                    searchByList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                padding: const EdgeInsets.all(8.0),
              ),
              const Expanded(
                child: TextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchArguments {
  final String searchBy;
  SearchArguments({required this.searchBy});
}
