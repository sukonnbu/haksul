import 'package:go_router/go_router.dart';
import 'package:haksul/db.dart';
import "package:flutter/material.dart";

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onClick;
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onClick,
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
      onTap: onClick,
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
            context.go("/$searchBy");
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

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Image.asset("assets/menubar_logo.png"),
          const SizedBox(
            height: 20,
          ),
          MenuItem(
            icon: Icons.home_rounded,
            title: "홈",
            onClick: () {
              context.replace("/");
            },
          ),
          MenuItem(
            icon: Icons.search_rounded,
            title: "검색",
            onClick: () {
              context.go("/search");
            },
          ),
          MenuItem(
            icon: Icons.domain_rounded,
            title: "학교 구조",
            onClick: () {
              context.go("/schoolstructure");
            },
          ),
          MenuItem(
            icon: Icons.map_rounded,
            title: "오시는 길",
            onClick: () {
              context.go("/directions");
            },
          )
        ],
      ),
    );
  }
}

TableRow routeTableRow({required String by, required String route}) {
  return TableRow(
    children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            by,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: "NanumSquareRound",
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            route,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontFamily: "NanumSquareRound",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      ),
    ],
  );
}
