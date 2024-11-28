import 'package:alura_quest/features/characterCreation/presentation/widgets/textForm_field_widget.dart';
import 'package:flutter/material.dart';

class CharacterCreationPage extends StatefulWidget {
  const CharacterCreationPage({super.key});

  @override
  State<CharacterCreationPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  final _formKey = GlobalKey<FormState>();
  final _inputNameController = TextEditingController();
  final _inputRaceController = TextEditingController();
  final _inputStrengthController = TextEditingController();
  final _inputUrlImageController = TextEditingController();

  @override
  void dispose() {
    _inputNameController.dispose();
    _inputRaceController.dispose();
    _inputStrengthController.dispose();
    _inputUrlImageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          "Novo personagem",
          style: TextStyle(
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
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
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
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 25, 149, 81),
                    minimumSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                  child: const Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
