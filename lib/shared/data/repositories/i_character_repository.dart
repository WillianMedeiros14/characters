import 'package:alura_quest/shared/model/character_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class ICharacterRepository {
  Future<Database> _getDatabase();
  Future createCharacter({required CharacterModel character});
}
