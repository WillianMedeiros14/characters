import 'package:alura_quest/shared/data/constants/sqlite/TABLE_NAME.dart';
import 'package:alura_quest/shared/data/dio/dio_client_http.dart';
import 'package:alura_quest/shared/errors/exceptions.dart';
import 'package:alura_quest/shared/model/character_model.dart';
import 'package:alura_quest/shared/data/repositories/i_character_repository.dart';

class CharacterApiRepository implements ICharacterRepository {
  final IHttpCharacterClient client;

  CharacterApiRepository({
    required this.client,
  });

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
      return null;
    } else {
      return null;
    }
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
        NotFoundException('A URL informada não é válida');
        return null;
      } else {
        Exception('Não foi possível carregar os personagens');
        return null;
      }
    } catch (e) {
      Exception('Erro ao carregar os personagens: $e');
      return null;
    }
  }

  @override
  Future<bool> deleteCharacterById({required int characterId}) async {
    try {
      final response = await client.deleteCharacter(
        endpoint: "/Character/$characterId",
      );

      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  @override
  Future<CharacterModel?> editCharacter({
    required CharacterModel character,
  }) async {
    try {
      final response = await client.updateCharacter(
        endpoint: "/Character/${character.id}",
        data: character.toJson(),
      );

      return character;
    } catch (ex) {
      print(ex);
      return null;
    }
  }
}
