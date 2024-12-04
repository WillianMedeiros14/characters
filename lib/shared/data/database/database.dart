import 'package:alura_quest/shared/data/constants/sqlite/CREATE_CHARACTER_TABLE_SCRIPT.dart';
import 'package:alura_quest/shared/data/constants/sqlite/TABLE_NAME.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

Future<Database> getDatabase() async {
  return openDatabase(
    p.join(await getDatabasesPath(), TABLE_NAME),
    onCreate: (db, version) {
      return db.execute(CREATE_CHARACTER_TABLE_SCRIPT);
    },
    version: 1,
  );
}
