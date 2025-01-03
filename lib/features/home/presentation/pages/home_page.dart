import 'package:alura_quest/features/characterCreation/presentation/stores/characters_store.dart';
import 'package:alura_quest/features/home/presentation/widgets/personagem_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final double opacityLevel;
  const HomePage({super.key, required this.opacityLevel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final charactersStore = Provider.of<CharactersStore>(
      context,
      listen: false,
    );
    charactersStore.initializeCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final CharactersStore charactersStore =
        Provider.of<CharactersStore>(context, listen: false);

    return Scaffold(
      body: AnimatedOpacity(
        opacity: widget.opacityLevel,
        duration: const Duration(microseconds: 600),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 120),
              child: Observer(
                builder: (_) {
                  if (charactersStore.isLoading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  return Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: charactersStore.characterList.map((character) {
                      return PersonagemCardWidget(
                        character: character,
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
