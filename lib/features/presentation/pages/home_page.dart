import 'package:alura_quest/features/presentation/data/character_list_data.dart';
import 'package:alura_quest/features/presentation/widgets/personagem_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
