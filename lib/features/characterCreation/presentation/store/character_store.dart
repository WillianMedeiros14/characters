import 'package:alura_quest/shared/model/character_model.dart';
import 'package:mobx/mobx.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStore with _$CharacterStore;

abstract class _CharacterStore with Store {
  @observable
  List<CharacterModel> characterList = ObservableList<CharacterModel>();

  @action
  void addCharacter(CharacterModel item) {
    characterList.add(item);
  }
}
