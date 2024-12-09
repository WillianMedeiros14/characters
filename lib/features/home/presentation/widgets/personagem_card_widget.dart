import 'package:alura_quest/features/home/presentation/pages/character_details_page.dart';
import 'package:alura_quest/features/home/presentation/widgets/change_character_hit_point_button_widget.dart';
import 'package:alura_quest/features/home/presentation/widgets/strength_start_widget.dart';
import 'package:alura_quest/shared/model/character_model.dart';
import 'package:flutter/material.dart';

class PersonagemCardWidget extends StatefulWidget {
  final CharacterModel character;
  const PersonagemCardWidget({super.key, required this.character});

  @override
  State<PersonagemCardWidget> createState() => _PersonagemCardWidgetState();
}

class _PersonagemCardWidgetState extends State<PersonagemCardWidget> {
  late double hitPoints = 100;

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
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 0, right: 0, bottom: 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(0),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.character.url,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.character.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                widget.character.race,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 81, 80, 80),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              StrengthStartWidget(
                                strength: widget.character.strength,
                              )
                            ],
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
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                  bottom: 10, left: 16, right: 16, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: LinearProgressIndicator(
                        value: hitPoints / 100,
                        semanticsLabel: 'Linear progress indicator',
                        backgroundColor:
                            hitPoints > 0 ? Colors.amber[100] : Colors.red,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.green,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Vida: ${hitPoints.toInt()}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CharacterDetailsPage(),
              settings: RouteSettings(
                arguments: {'character': widget.character},
              ),
            ),
          )
        },
      ),
    );
  }
}
