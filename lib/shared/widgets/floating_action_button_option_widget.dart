import 'package:alura_quest/features/characterCreation/presentation/pages/character_creation_page.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonOptionWidget extends StatelessWidget {
  final VoidCallback onChangeOpacity;
  final double opacityLevel;
  const FloatingActionButtonOptionWidget(
      {super.key, required this.onChangeOpacity, required this.opacityLevel});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(16),
                ),
                onPressed: onChangeOpacity,
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
    );
  }
}
