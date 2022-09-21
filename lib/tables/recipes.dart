import 'package:drift/drift.dart';

class RecipesDataModel extends Table {
  TextColumn get id => text()();
  TextColumn get imageName => text()();
  TextColumn get datatime => text()();
  TextColumn get description => text()();
  TextColumn get imgFirstName => text()();
}