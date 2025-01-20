import 'package:alura_quest/features/home/data/character_list_data.dart';
import 'package:alura_quest/shared/data/repositories/character_api_repository.dart';
import 'package:alura_quest/shared/data/repositories/character_repository.dart';
import 'package:alura_quest/shared/model/character_model.dart';
import 'package:mobx/mobx.dart';

part 'characters_store.g.dart';

class CharactersStore = _CharactersStore with _$CharactersStore;

abstract class _CharactersStore with Store {
  final CharacterApiRepository characterRepository;

  _CharactersStore({required this.characterRepository});

  @observable
  List<CharacterModel> characterList = ObservableList<CharacterModel>();

  @observable
  List<CharacterModel> searchCharacterListAll =
      ObservableList<CharacterModel>();

  @observable
  bool isLoading = true;

  @observable
  bool isLoadingDelete = false;

  @action
  Future<void> initializeCharacters() async {
    isLoading = true;
    await getAllCharacters();

    final dataLocal = characters
        .map((character) => CharacterModel.fromMap(character))
        .toList();

    characterList.addAll(dataLocal);
    searchCharacterListAll = ObservableList.of(characterList);

    isLoading = false;
  }

  @action
  Future<bool> addNewCharacter(CharacterModel item) async {
    final result = await characterRepository.createCharacter(character: item);

    if (result != null) {
      characterList.insert(0, result);
      searchCharacterListAll = ObservableList.of(characterList);

      return true;
    } else {
      return false;
    }
  }

  @action
  Future getAllCharacters() async {
    final result = await characterRepository.getAllCharacters();

    if (result != null) {
      characterList = ObservableList.of(result);
    }
  }

  @action
  Future<bool> deleteCharacterById(int characterId) async {
    isLoadingDelete = true;
    final result =
        await characterRepository.deleteCharacterById(characterId: characterId);

    if (result == true) {
      characterList.removeWhere((character) => character.id == characterId);
      isLoadingDelete = false;
      return true;
    } else {
      isLoadingDelete = false;
      return false;
    }
  }

  @action
  Future<bool> editCharacter({required CharacterModel character}) async {
    final result =
        await characterRepository.editCharacter(character: character);

    if (result != null) {
      final index = characterList.indexWhere((c) => c.id == character.id);

      if (index != -1) {
        characterList[index] = result;
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @action
  Future<void> searchCharacters({required String searchValue}) async {
    try {
      if (searchValue.isNotEmpty) {
        final filteredCharacters = searchCharacterListAll.where((character) {
          final lowerCaseSearch = searchValue.toLowerCase();
          return character.name.toLowerCase().contains(lowerCaseSearch) ||
              character.race.toLowerCase().contains(lowerCaseSearch);
        }).toList();

        characterList
          ..clear()
          ..addAll(filteredCharacters);
      } else {
        characterList = ObservableList.of(searchCharacterListAll);
      }
    } catch (e) {
      print('Erro ao buscar personagens na lista: $e');
    }
  }
}
