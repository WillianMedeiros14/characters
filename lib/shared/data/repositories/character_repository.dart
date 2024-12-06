import 'package:alura_quest/shared/data/constants/sqlite/TABLE_NAME.dart';
import 'package:alura_quest/shared/model/character_model.dart';
import 'package:alura_quest/shared/data/repositories/i_character_repository.dart';
import 'package:alura_quest/shared/data/constants/sqlite/CREATE_CHARACTER_TABLE_SCRIPT.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class CharacterRepository implements ICharacterRepository {
  @override
  Future<int?> createCharacter({required CharacterModel character}) async {
    try {
      final Database db = await _getDatabase();

      final result = await db.insert(
        TABLE_NAME,
        character.toMap(),
      );

      return result;
    } catch (ex) {
      print("Erro ao criar ");
      print(ex);
      return null;
    }
  }

  @override
  Future<List<CharacterModel>?> getAllCharacters() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);

      return List.generate(
        maps.length,
        (i) {
          return CharacterModel.fromMap(maps[i]);
        },
      );
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  @override
  Future<Database> _getDatabase() async {
    return openDatabase(
      p.join(await getDatabasesPath(), TABLE_NAME),
      onCreate: (db, version) {
        return db.execute(CREATE_CHARACTER_TABLE_SCRIPT);
      },
      version: 1,
    );
  }
}
