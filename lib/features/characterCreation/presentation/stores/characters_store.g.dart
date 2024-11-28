// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersStore on _CharactersStore, Store {
  late final _$characterListAtom =
      Atom(name: '_CharactersStore.characterList', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_CharactersStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_CharactersStoreActionController =
      ActionController(name: '_CharactersStore', context: context);

  @override
  void initializeCharacters() {
    final _$actionInfo = _$_CharactersStoreActionController.startAction(
        name: '_CharactersStore.initializeCharacters');
    try {
      return super.initializeCharacters();
    } finally {
      _$_CharactersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewCharacter(CharacterModel item) {
    final _$actionInfo = _$_CharactersStoreActionController.startAction(
        name: '_CharactersStore.addNewCharacter');
    try {
      return super.addNewCharacter(item);
    } finally {
      _$_CharactersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
characterList: ${characterList},
isLoading: ${isLoading}
    ''';
  }
}
