import 'package:alura_quest/features/characterCreation/presentation/stores/characters_store.dart';
import 'package:alura_quest/features/home/presentation/pages/character_details_page.dart';
import 'package:alura_quest/features/home/presentation/widgets/strength_start_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeSliderPage extends StatefulWidget {
  final double opacityLevel;
  const HomeSliderPage({super.key, required this.opacityLevel});

  @override
  _HomeSliderPageState createState() => _HomeSliderPageState();
}

class _HomeSliderPageState extends State<HomeSliderPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final CharactersStore charactersStore =
        Provider.of<CharactersStore>(context, listen: false);

    final screenSize = MediaQuery.of(context).size;

    final height = screenSize.height;

    return AnimatedOpacity(
      opacity: widget.opacityLevel,
      duration: const Duration(microseconds: 600),
      child: SizedBox(
        height: height,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Observer(
                builder: (_) {
                  if (charactersStore.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        key: ValueKey<int>(currentIndex),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              charactersStore.characterList[currentIndex].url,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.white.withOpacity(1),
                                Colors.white.withOpacity(0.5),
                                Colors.white.withOpacity(0.0),
                                Colors.white.withOpacity(0.0),
                                Colors.white.withOpacity(0.0),
                                Colors.white.withOpacity(0.0),
                                Colors.white.withOpacity(1),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              FractionallySizedBox(
                heightFactor: 0.70,
                child: Observer(
                  builder: (_) {
                    return PageView.builder(
                      itemCount: charactersStore.characterList.length,
                      onPageChanged: (int page) {
                        setState(() {
                          currentIndex = page;
                        });
                      },
                      itemBuilder: (context, int index) {
                        final character = charactersStore.characterList[index];

                        return FractionallySizedBox(
                          widthFactor: 0.8,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CharacterDetailsPage(
                                    character: character,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                image: DecorationImage(
                                  image: NetworkImage(character.url),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.6),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(32),
                                          bottomRight: Radius.circular(32),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            character.name,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          StrengthStartWidget(
                                            strength: character.strength,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            character.description,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
