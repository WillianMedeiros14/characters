import 'package:alura_quest/features/home/data/character_list_data.dart';
import 'package:alura_quest/shared/data/repositories/character_repository.dart';
import 'package:alura_quest/shared/model/character_model.dart';
import 'package:mobx/mobx.dart';

part 'characters_store.g.dart';

class CharactersStore = _CharactersStore with _$CharactersStore;

abstract class _CharactersStore with Store {
  final CharacterRepository characterRepository;

  _CharactersStore({required this.characterRepository});

  @observable
  List<CharacterModel> characterList = ObservableList<CharacterModel>();

  @observable
  bool isLoading = true;

  @action
  Future<void> initializeCharacters() async {
    isLoading = true;
    await getAllCharacters();

    // final dataLocal = characters.map((character) => CharacterModel.fromMap(character));
    final dataLocal = characters
        .map((character) => CharacterModel.fromMap(character))
        .toList();

    characterList.addAll(dataLocal);

    isLoading = false;
  }

  @action
  Future<bool> addNewCharacter(CharacterModel item) async {
    final result = await characterRepository.createCharacter(character: item);

    if (result != null) {
      final newCharacter = item;
      newCharacter.id = result;
      characterList.insert(0, newCharacter);
      return true;
    } else {
      return false;
    }
  }

  @action
  Future getAllCharacters() async {
    final result = await characterRepository.getAllCharacters();

    if (result != null) {
      characterList = ObservableList.of(result.reversed);
    }
  }
}
