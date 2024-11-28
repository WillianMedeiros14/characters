import 'package:alura_quest/features/characterCreation/presentation/pages/character_creation_page.dart';
import 'package:alura_quest/features/characterCreation/presentation/stores/characters_store.dart';
import 'package:alura_quest/features/home/presentation/widgets/personagem_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    super.initState();

    final charactersStore =
        Provider.of<CharactersStore>(context, listen: false);
    charactersStore.initializeCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final CharactersStore charactersStore =
        Provider.of<CharactersStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: AnimatedOpacity(
        opacity: opacityLevel,
        duration: const Duration(microseconds: 700),
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
                        name: character.name,
                        race: character.race,
                        url: character.url,
                        strength: character.strength,
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 25, 149, 81),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CharacterCreationPage()),
          )
        },
        tooltip: 'Opacity',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
