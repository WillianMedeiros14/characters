import 'package:alura_quest/features/characterCreation/presentation/pages/character_creation_page.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Observer(
          builder: (_) {
            return Text(widget.title);
          },
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacityLevel,
        duration: const Duration(microseconds: 600),
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 120),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  PersonagemCardWidget(
                    name: "Legolas",
                    race: "Elfo",
                    url:
                        "https://files.idyllic.app/files/static/260459?width=750&optimizer=image",
                    strength: 4,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            right: 16,
            bottom: 16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 25, 149, 81),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: _changeOpacity,
                  child: opacityLevel == 1.0
                      ? const Icon(
                          Icons.visibility,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: Colors.white,
                        ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 25, 149, 81),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CharacterCreationPage(),
                      ),
                    )
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
