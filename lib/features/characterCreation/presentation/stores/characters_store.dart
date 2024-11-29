import 'package:alura_quest/features/home/data/character_list_data.dart';
import 'package:alura_quest/shared/model/character_model.dart';
import 'package:mobx/mobx.dart';

part 'characters_store.g.dart';

class CharactersStore = _CharactersStore with _$CharactersStore;

abstract class _CharactersStore with Store {
  @observable
  List<CharacterModel> characterList = ObservableList<CharacterModel>();

  @observable
  bool isLoading = true;

  @action
  void initializeCharacters() {
    isLoading = true;
    characterList = ObservableList.of(
      characters.map((character) => CharacterModel.fromMap(character)),
    );

    isLoading = false;
  }

  @action
  void addNewCharacter(CharacterModel item) {
    characterList.insert(0, item);
  }
}
