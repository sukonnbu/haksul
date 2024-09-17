import 'package:flutter/material.dart';
import 'package:haksul/db.dart';
import 'package:haksul/screens/searchpage.dart';

class HaksulHomePage extends StatefulWidget {
  const HaksulHomePage({super.key});

  @override
  State<HaksulHomePage> createState() => _HaksulHomePageState();
}

class _HaksulHomePageState extends State<HaksulHomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final Future<List<ReportModel>> _popularReports =
      MongoDatabase.getPopularReports();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "2024 경희고등학교 학술제",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "NanumBarunGothic",
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF193073),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Image.asset("assets/menubar_logo.png"),
            const SizedBox(
              height: 20,
            ),
            const MenuItem(
              icon: Icons.search_rounded,
              title: "검색",
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/kyunghee.png",
                        scale: 3.5,
                      ),
                      Transform.translate(
                        offset: const Offset(-15, 0),
                        child: const Text(
                          "2024 경희고등학교 학술제",
                          style: TextStyle(
                            fontFamily: "NanumBarunGothic",
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 250,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: [
                          buildBanner('Banner 1', 0),
                          buildBanner('Banner 2', 1),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 2; i++)
                                Container(
                                  margin: const EdgeInsets.all(4.0),
                                  width: 12.0,
                                  height: 12.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentPage == i
                                        ? Colors.grey
                                        : Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.search,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "다음으로 검색",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "NanumSquare",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SearchByButton(
                            icon: Icons.person_rounded,
                            text: "사람",
                            searchBy: "person",
                          ),
                          SearchByButton(
                            icon: Icons.subject_rounded,
                            text: "주제",
                            searchBy: "subject",
                          ),
                          SearchByButton(
                            icon: Icons.place,
                            text: "장소",
                            searchBy: "place",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.article_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "인기 보고서",
                          style: TextStyle(
                            fontFamily: "NanumSquare",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      child: FutureBuilder(
                          future: _popularReports,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Scrollbar(
                                    radius: const Radius.circular(10),
                                    child: ListView.separated(
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        ReportModel report =
                                            snapshot.data![index];

                                        return SizedBox(
                                          height: 46,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 35,
                                                  child: Text(
                                                    "${index + 1}",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "NanumSquareRound",
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontFamily:
                                                          "NanumBarunGothic",
                                                      fontSize: 23,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const Divider(
                                        thickness: 0.3,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
      child: Column(
        children: [
          Transform.translate(
            offset: const Offset(0, 5),
            child: IconButton(
              onPressed: () => {
                Navigator.of(context).pushNamed(
                  "/search",
                  arguments: SearchArguments(
                    searchBy: searchBy,
                  ),
                )
              },
              icon: Icon(
                icon,
                size: 50,
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -5),
            child: TextButton(
              style: const ButtonStyle(),
              onPressed: () => {
                Navigator.of(context).pushNamed(
                  "/search",
                  arguments: SearchArguments(
                    searchBy: searchBy,
                  ),
                )
              },
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 23,
                  fontFamily: "NanumBarunGothic",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildBanner(String text, int index) {
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
    )),
  );
}
