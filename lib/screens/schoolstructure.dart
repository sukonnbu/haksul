import "package:flutter/material.dart";
import "package:haksul/components.dart";
import "package:haksul/fakedata.dart";

class SchoolStructurePage extends StatelessWidget {
  const SchoolStructurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar("학교 구조"),
      drawer: const DrawerMenu(),
      body: Text(
        Fakedata.generateImage(),
      ),
    );
  }
}
