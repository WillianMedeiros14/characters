// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterStore on _CharacterStore, Store {
  late final _$characterListAtom =
      Atom(name: '_CharacterStore.characterList', context: context);

  @override
  List<CharacterModel> get characterList {
    _$characterListAtom.reportRead();
    return super.characterList;
  }

  @override
  set characterList(List<CharacterModel> value) {
    _$characterListAtom.reportWrite(value, super.characterList, () {
      super.characterList = value;
    });
  }

  late final _$_CharacterStoreActionController =
      ActionController(name: '_CharacterStore', context: context);

  @override
  void addCharacter(CharacterModel item) {
    final _$actionInfo = _$_CharacterStoreActionController.startAction(
        name: '_CharacterStore.addCharacter');
    try {
      return super.addCharacter(item);
    } finally {
      _$_CharacterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
characterList: ${characterList}
    ''';
  }
}
