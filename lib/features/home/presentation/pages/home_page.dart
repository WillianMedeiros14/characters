import 'package:alura_quest/features/home/presentation/data/character_list_data.dart';
import 'package:alura_quest/features/home/presentation/widgets/personagem_card_widget.dart';
import 'package:flutter/material.dart';

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
        title: Text(widget.title),
      ),
      body: AnimatedOpacity(
        opacity: opacityLevel,
        duration: const Duration(microseconds: 700),
        child: ListView.builder(
          padding:
              const EdgeInsets.only(bottom: 100, left: 16, right: 16, top: 0),
          itemCount: characters.length,
          itemBuilder: (context, index) {
            final personagem = characters[index];
            return PersonagemCardWidget(
              name: personagem['name'],
              race: personagem['race'],
              url: personagem['url'],
              strength: personagem['strength'],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 25, 149, 81),
        onPressed: _changeOpacity,
        tooltip: 'Opacity',
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
    );
  }
}
