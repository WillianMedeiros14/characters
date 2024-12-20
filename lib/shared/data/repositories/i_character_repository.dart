import 'package:alura_quest/shared/model/character_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class ICharacterRepository {
  Future<Database> _getDatabase();
  Future<CharacterModel?> createCharacter({required CharacterModel character});
  Future<List<CharacterModel>?> getAllCharacters();
  Future<bool> deleteCharacterById({required int characterId});
  Future<CharacterModel?> editCharacter({required CharacterModel character});
}
