import 'package:alura_quest/features/characterCreation/presentation/stores/characters_store.dart';
import 'package:alura_quest/features/characterCreation/presentation/widgets/textForm_field_widget.dart';
import 'package:alura_quest/features/home/presentation/pages/character_details_page.dart';
import 'package:alura_quest/shared/model/character_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterCreationPage extends StatefulWidget {
  final CharacterModel? character;

  const CharacterCreationPage({super.key, this.character});

  @override
  State<CharacterCreationPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  final _formKey = GlobalKey<FormState>();
  final _inputNameController = TextEditingController();
  final _inputRaceController = TextEditingController();
  final _inputStrengthController = TextEditingController();
  final _inputUrlImageController = TextEditingController();
  final _inputDescriptionController = TextEditingController();

  late CharacterModel character;

  @override
  void dispose() {
    _inputNameController.dispose();
    _inputRaceController.dispose();
    _inputStrengthController.dispose();
    _inputUrlImageController.dispose();
    _inputDescriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    if (widget.character != null) {
      character = widget.character!;

      _inputNameController.text = character.name;
      _inputRaceController.text = character.race;
      _inputStrengthController.text = character.strength.toString();
      _inputUrlImageController.text = character.url;
      _inputDescriptionController.text = character.description;
    }
  }

  void _realTimeValidation() {
    _formKey.currentState!.validate();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final CharactersStore charactersStore =
        Provider.of<CharactersStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          widget.character != null ? "Edição de personagem" : "Novo personagem",
          style: const TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormFieldWidget(
                  controller: _inputNameController,
                  labelText: 'Nome',
                  hintText: 'Insira o nome',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o nome';
                    }
                    return null;
                  },
                  onChanged: _realTimeValidation,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormFieldWidget(
                  controller: _inputRaceController,
                  labelText: 'Raça',
                  hintText: 'Insira a raça',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira a raça';
                    }
                    return null;
                  },
                  onChanged: _realTimeValidation,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormFieldWidget(
                  controller: _inputStrengthController,
                  labelText: 'Força',
                  hintText: 'Insira a força (Ex: 3)',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira a força (Ex: 3)';
                    }
                    return null;
                  },
                  onChanged: _realTimeValidation,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormFieldWidget(
                  controller: _inputUrlImageController,
                  labelText: 'Url da imagem',
                  hintText: 'Insira uma url da imagem',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira uma url da imagem';
                    }
                    return null;
                  },
                  onChanged: _realTimeValidation,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormFieldWidget(
                  controller: _inputDescriptionController,
                  labelText: 'Descriçao sobre o personagem',
                  hintText: 'Insira descriçao sobre o personagem',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira descriçao sobre o personagem';
                    }
                    return null;
                  },
                  onChanged: _realTimeValidation,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  child: _inputUrlImageController.text.isNotEmpty
                      ? Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 255, 255, 255),
                            image: DecorationImage(
                              image: NetworkImage(
                                _inputUrlImageController.text,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      CharacterModel newCharacter = CharacterModel(
                        name: _inputNameController.text,
                        race: _inputRaceController.text,
                        url: _inputUrlImageController.text,
                        strength: int.parse(_inputStrengthController.text),
                        description: _inputDescriptionController.text,
                      );

                      final bool? result;
                      if (widget.character == null) {
                        result = await charactersStore.addNewCharacter(
                          newCharacter,
                        );
                      } else {
                        newCharacter.id = widget.character!.id;
                        result = await charactersStore.editCharacter(
                          character: newCharacter,
                        );
                      }

                      if (result == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                const Color.fromARGB(255, 25, 149, 81),
                            content: Text(
                              'Personagem ${widget.character != null ? "editado" : "criado"} com sucesso',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );

                        if (widget.character != null) {
                          Navigator.popUntil(context, (route) => route.isFirst);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CharacterDetailsPage(
                                character: newCharacter,
                              ),
                            ),
                          );
                        } else {
                          Navigator.pop(context);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color.fromARGB(255, 225, 68, 10),
                            content: Text(
                              'Erro ao ${widget.character != null ? "editar" : "inserir"} personagem',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 25, 149, 81),
                    minimumSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                  child: Text(
                    widget.character != null ? 'Salvar edição' : 'Salvar',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
