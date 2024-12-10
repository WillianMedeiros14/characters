import 'package:alura_quest/features/home/presentation/widgets/change_character_hit_point_button_widget.dart';
import 'package:alura_quest/features/home/presentation/widgets/more_options_page_details.dart';
import 'package:alura_quest/features/home/presentation/widgets/strength_start_widget.dart';
import 'package:alura_quest/shared/model/character_model.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

class CharacterDetailsPage extends StatefulWidget {
  final CharacterModel? character;

  const CharacterDetailsPage({super.key, this.character});

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  late CharacterModel character;

  late double hitPoints = 100;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null && args.containsKey('character')) {
      character = args['character'] as CharacterModel;
    } else {
      print("Personagem não passado");
    }
  }

  void _changeHitPointsUp() {
    setState(() {
      if (hitPoints < 100) {
        hitPoints = hitPoints + 10;
      }
    });
  }

  void _changeHitPointsDown() {
    setState(() {
      if (hitPoints > 0) {
        hitPoints = hitPoints - 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          if (character != null && character.id > 0)
            MoreOptionsPageDetails(
              character: character,
            ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            height: MediaQuery.of(context).size.width - 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              image: DecorationImage(
                                image: NetworkImage(
                                  character.url,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          character.name,
                          style: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StrengthStartWidget(
                              strength: character.strength,
                              sizeIcon: 25,
                            ),
                            Column(
                              children: [
                                ChangeCharacterHitPointButton(
                                  iconButton: Icons.keyboard_arrow_up,
                                  onPressed: _changeHitPointsUp,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ChangeCharacterHitPointButton(
                                  iconButton: Icons.keyboard_arrow_down,
                                  onPressed: _changeHitPointsDown,
                                ),
                              ],
                            )
                          ],
                        ),
                        const LineVertical(),
                        Text(
                          character.description,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                        const LineVertical(),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Container(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InformationsCard(
                    information: character.race,
                    icon: Icons.groups_2_outlined,
                  ),
                  const SizedBox(width: 20),
                  InformationsCard(
                    information: hitPoints.toInt().toString(),
                    icon: Icons.favorite_border,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LineVertical extends StatelessWidget {
  const LineVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.5,
      margin: const EdgeInsets.symmetric(vertical: 30),
      color: const Color.fromARGB(255, 156, 152, 152),
    );
  }
}

class InformationsCard extends StatelessWidget {
  const InformationsCard({
    super.key,
    required this.information,
    this.icon,
    this.image,
  });

  final String information;
  final IconData? icon;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(
        minWidth: 80,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.amberAccent.shade700,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Image(
                    image: image!,
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  )
                : Icon(
                    icon,
                    size: 30,
                  ),
            Text(
              information,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
