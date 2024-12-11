import 'package:alura_quest/features/characterCreation/presentation/pages/character_creation_page.dart';
import 'package:alura_quest/features/myApp/presentation/widgets/modal_to_change_page_type_widget.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonOptionWidget extends StatelessWidget {
  final VoidCallback onChangeOpacity;
  final double opacityLevel;
  final void Function(bool) onTogglePageList;
  final void Function(bool) onTogglePageSlider;
  final bool isCollumn;

  const FloatingActionButtonOptionWidget({
    super.key,
    required this.onChangeOpacity,
    required this.opacityLevel,
    required this.onTogglePageList,
    required this.onTogglePageSlider,
    required this.isCollumn,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 16,
          bottom: 16,
          child: isCollumn
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ModalToChangePageTypeWidget(
                      onTogglePageList: () => onTogglePageList(true),
                      onTogglePageSlider: () => onTogglePageSlider(false),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
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
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ModalToChangePageTypeWidget(
                      onTogglePageList: () => onTogglePageList(true),
                      onTogglePageSlider: () => onTogglePageSlider(false),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
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
                      width: 16,
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
