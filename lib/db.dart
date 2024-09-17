import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static Db? db;
  static final DbCollection reports = db!.collection("reports");

  static connect() async {
    try {
      db = await Db.create(
          'mongodb+srv://choijiwan1206:KENJTBN26euoNiX0@haksul.17hld.mongodb.net/kyungheeboy');
      await db!.open();
      inspect(db);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<List<ReportModel>> getPopularReports() async {
    try {
      final result = reports.find(where.sortBy("visitors", descending: true));
      List<Map<String, dynamic>> resultList = await result.toList();
      resultList = resultList.sublist(0, 10);

      List<ReportModel> popularList = [];
      for (Map<String, dynamic> report in resultList) {
        popularList.add(
          ReportModel(
            title: report["title"],
            description: report["description"],
            writer: report["writer"],
            place: report["place"],
            tags: report["tags"],
            visitors: report["visitors"],
          ),
        );
      }

      return popularList;
    } catch (e) {
      log(e.toString());
      return List.filled(10, ReportModel(title: "내부적인 문제가 발생했습니다"));
    }
  }

  static close() async {
    try {
      await db!.close();
    } catch (e) {
      log(e.toString());
    }
  }
}

class ReportModel {
  final String title, description, writer, place;
  final List tags;
  final int visitors;
  ReportModel({
    required this.title,
    this.description = "",
    this.writer = "",
    this.place = "",
    this.tags = const [],
    this.visitors = 0,
  });
}
