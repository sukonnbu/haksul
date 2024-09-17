import 'package:flutter/material.dart';
import 'package:haksul/screens/searchpage.dart';

class HaksulHomePage extends StatefulWidget {
  const HaksulHomePage({super.key});

  @override
  State<HaksulHomePage> createState() => _HaksulHomePageState();
}

class _HaksulHomePageState extends State<HaksulHomePage> {
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
        backgroundColor: const Color.fromRGBO(19, 30, 73, 0.9),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "2024 경희고등학교 학술제",
                style: TextStyle(
                  fontFamily: "NanumBarunGothic",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset("assets/kyunghee.png"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
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
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.search),
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
              ),
            ],
          ),
        ),
      ),
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
                  fontSize: 18,
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
