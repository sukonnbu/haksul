import "package:flutter/material.dart";
import 'package:haksul/db.dart';
import 'package:haksul/screens/searchpage.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 25,
          fontFamily: "NanumSquare",
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {/**추후 수정 */},
    );
  }
}

class SearchByButton extends StatelessWidget {
  final dynamic icon;
  final String text, searchBy;
  const SearchByButton({
    super.key,
    required this.icon,
    required this.text,
    required this.searchBy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.of(context).pushNamed("/search",
                arguments: SearchArguments(searchBy: searchBy));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 50,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 23,
                    fontFamily: "NanumBarunGothic",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container buildBanner(String text, int index) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blueGrey[100],
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 30,
        ),
      ),
    ),
  );
}

AppBar commonAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontFamily: "NanumBarunGothic",
      ),
    ),
    centerTitle: true,
    backgroundColor: const Color(0xFF193073),
    foregroundColor: Colors.white,
    elevation: 2,
  );
}

class PopularReportListItem extends StatelessWidget {
  final int index;
  const PopularReportListItem({
    super.key,
    required this.report,
    required this.index,
  });

  final ReportModel report;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Row(
            children: [
              SizedBox(
                width: 35,
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                    fontFamily: "NanumSquareRound",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.blue[900],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  report.title,
                  style: const TextStyle(
                    fontFamily: "NanumBarunGothic",
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
