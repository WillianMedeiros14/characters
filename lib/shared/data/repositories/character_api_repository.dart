import 'package:alura_quest/shared/data/constants/sqlite/TABLE_NAME.dart';
import 'package:alura_quest/shared/data/dio/dio_client_http.dart';
import 'package:alura_quest/shared/errors/exceptions.dart';
import 'package:alura_quest/shared/model/character_model.dart';
import 'package:alura_quest/shared/data/repositories/i_character_repository.dart';
import 'package:alura_quest/shared/data/constants/sqlite/CREATE_CHARACTER_TABLE_SCRIPT.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class CharacterApiRepository implements ICharacterRepository {
  final IHttpCharacterClient client;

  CharacterApiRepository({required this.client});
  @override
  Future<CharacterModel?> createCharacter(
      {required CharacterModel character}) async {
    final response = await client.createCharacter(
        endpoint: "/Character", data: character.toJson());

    if (response.statusCode == 201) {
      final body = response.data;

      final CharacterModel characterCreated = CharacterModel.fromMap(body);

      return characterCreated;
    } else if (response.statusCode == 404) {
      // throw NotFoundException('A url informada não é válida');
      return null;
    } else {
      // throw Exception('Não foi possível criar o pedido');
      return null;
    }
    // try {
    //   final Database db = await _getDatabase();

    //   final result = await db.insert(
    //     TABLE_NAME,
    //     character.toMap(),
    //   );

    //   return result;
    // } catch (ex) {
    //   print("Erro ao criar ");
    //   print(ex);
    //   return null;
    // }
  }

  @override
  Future<List<CharacterModel>?> getAllCharacters() async {
    try {
      final response = await client.getAll(endpoint: "/Character");

      if (response.statusCode == 200) {
        final List<dynamic> body = response.data;

        final List<CharacterModel> characters = body.map((item) {
          return CharacterModel.fromMap(item);
        }).toList();

        return characters;
      } else if (response.statusCode == 404) {
        throw NotFoundException('A URL informada não é válida');
      } else {
        throw Exception('Não foi possível carregar os personagens');
      }
    } catch (e) {
      throw Exception('Erro ao carregar os personagens: $e');
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

  @override
  Future<bool> deleteCharacterById({required int characterId}) async {
    try {
      final Database db = await _getDatabase();

      int result = await db.delete(
        TABLE_NAME,
        where: "id = ?",
        whereArgs: [characterId],
      );

      if (result > 0) {
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  @override
  Future<bool> editCharacter({required CharacterModel character}) async {
    try {
      final Database db = await _getDatabase();

      int result = await db.update(
        TABLE_NAME,
        character.toMap(),
        where: "id = ?",
        whereArgs: [character.id],
      );

      print("result");
      print(result);
      if (result > 0) {
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }
}
