import 'package:alura_quest/features/characterCreation/presentation/stores/characters_store.dart';
import 'package:alura_quest/features/home/presentation/widgets/personagem_card_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePageColumn extends StatefulWidget {
  final double opacityLevel;
  const HomePageColumn({super.key, required this.opacityLevel});

  @override
  State<HomePageColumn> createState() => _HomePageColumnState();
}

class _HomePageColumnState extends State<HomePageColumn> {
  @override
  Widget build(BuildContext context) {
    final CharactersStore charactersStore = Provider.of<CharactersStore>(
      context,
      listen: false,
    );

    return AnimatedOpacity(
      opacity: widget.opacityLevel,
      duration: const Duration(microseconds: 600),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 120),
        child: Column(
          children: [
            Observer(
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
          ],
        ),
      ),
    );
  }
}
