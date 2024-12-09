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

  late final _$initializeCharactersAsyncAction =
      AsyncAction('_CharactersStore.initializeCharacters', context: context);

  @override
  Future<void> initializeCharacters() {
    return _$initializeCharactersAsyncAction
        .run(() => super.initializeCharacters());
  }

  late final _$addNewCharacterAsyncAction =
      AsyncAction('_CharactersStore.addNewCharacter', context: context);

  @override
  Future<bool> addNewCharacter(CharacterModel item) {
    return _$addNewCharacterAsyncAction.run(() => super.addNewCharacter(item));
  }

  late final _$getAllCharactersAsyncAction =
      AsyncAction('_CharactersStore.getAllCharacters', context: context);

  @override
  Future<dynamic> getAllCharacters() {
    return _$getAllCharactersAsyncAction.run(() => super.getAllCharacters());
  }

  late final _$deleteCharacterByIdAsyncAction =
      AsyncAction('_CharactersStore.deleteCharacterById', context: context);

  @override
  Future<bool> deleteCharacterById(int characterId) {
    return _$deleteCharacterByIdAsyncAction
        .run(() => super.deleteCharacterById(characterId));
  }

  late final _$editCharacterAsyncAction =
      AsyncAction('_CharactersStore.editCharacter', context: context);

  @override
  Future<bool> editCharacter({required CharacterModel character}) {
    return _$editCharacterAsyncAction
        .run(() => super.editCharacter(character: character));
  }

  @override
  String toString() {
    return '''
characterList: ${characterList},
isLoading: ${isLoading}
    ''';
  }
}
