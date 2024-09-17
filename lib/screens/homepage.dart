import 'package:flutter/material.dart';
import 'package:haksul/db.dart';
import 'package:haksul/components.dart';

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
      appBar: commonAppBar("2024 경희고등학교 학술제"),
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
            const MenuItem(
              icon: Icons.domain_rounded,
              title: "학교 구조",
            ),
            const MenuItem(
              icon: Icons.map_rounded,
              title: "오시는 길",
            )
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

                                        return PopularReportListItem(
                                          report: report,
                                          index: index,
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
