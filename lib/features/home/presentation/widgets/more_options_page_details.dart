import 'package:alura_quest/features/characterCreation/presentation/stores/characters_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreOptionsPageDetails extends StatefulWidget {
  final int characterId;
  const MoreOptionsPageDetails({super.key, required this.characterId});

  @override
  State<MoreOptionsPageDetails> createState() => _MoreOptionsPageDetailsState();
}

class _MoreOptionsPageDetailsState extends State<MoreOptionsPageDetails> {
  @override
  Widget build(BuildContext context) {
    final CharactersStore charactersStore =
        Provider.of<CharactersStore>(context, listen: false);

    void _deleteCharacterById() async {
      final result =
          await charactersStore.deleteCharacterById(widget.characterId);

      if (result == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color.fromARGB(255, 25, 149, 81),
            content: Text(
              'Personagem deletado com suceso',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );

        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color.fromARGB(255, 225, 68, 10),
            content: Text(
              'Erro ao deletar personagem',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    }

    return IconButton(
      icon: const Icon(Icons.more_vert),
      color: Colors.black,
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Mais opções',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              _deleteCharacterById();
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Deletar',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 19),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
          },
        );
      },
    );
  }
}
