import 'package:faker_dart/faker_dart.dart';

class Fakedata {
  static final faker = Faker.instance;

  Fakedata() {
    faker.setLocale(FakerLocaleType.ko);
  }

  static int generateStdID() {
    int gradeNum = faker.datatype.number(min: 1, max: 3);
    int classNum = faker.datatype.number(min: 1, max: 8);
    int number = faker.datatype.number(min: 1, max: 35);
    return (gradeNum * 10000 + classNum * 100 + number);
  }

  static String generateName() => faker.name.fullName();
  static String generateDescription() => faker.lorem.paragraph();
  static String generateImage() => faker.image.image(width: 200, height: 200);
}
