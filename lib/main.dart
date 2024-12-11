import 'package:alura_quest/features/characterCreation/presentation/stores/characters_store.dart';
import 'package:alura_quest/myApp/presentation/pages/my_app.dart';
import 'package:alura_quest/shared/data/repositories/character_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<CharactersStore>(
          create: (_) => CharactersStore(
            characterRepository: CharacterRepository(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
