import 'package:alura_quest/features/characterCreation/presentation/pages/character_creation_page.dart';
import 'package:alura_quest/features/characterCreation/presentation/stores/characters_store.dart';
import 'package:alura_quest/shared/model/character_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreOptionsPageDetails extends StatefulWidget {
  final CharacterModel character;
  const MoreOptionsPageDetails({super.key, required this.character});

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
          await charactersStore.deleteCharacterById(widget.character.id);

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

    void _editCharacter() {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CharacterCreationPage(
            character: widget.character,
          ),
        ),
      );
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
                      Center(
                        child: Column(
                          children: <Widget>[
                            ItemMoreOptionsPageDetails(
                              onPressed: _editCharacter,
                              icon: Icons.edit,
                              colorIcon: Colors.black,
                              title: 'Editar',
                            ),
                            ItemMoreOptionsPageDetails(
                              onPressed: _deleteCharacterById,
                              icon: Icons.delete,
                              colorIcon: Colors.red,
                              title: 'Deletar',
                            ),
                          ],
                        ),
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

class ItemMoreOptionsPageDetails extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color colorIcon;
  final String title;
  const ItemMoreOptionsPageDetails({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title,
    required this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: colorIcon,
            size: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }
}
