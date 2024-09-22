import 'package:hive/hive.dart';

part 'model _class.g.dart';

@HiveType(typeId: 0)
class Model_Class {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int age;
  @HiveField(2)
  final int phone;

  Model_Class({required this.name, required this.age, required this.phone});
}
