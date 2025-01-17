import 'package:alura_quest/features/characterCreation/presentation/stores/characters_store.dart';
import 'package:alura_quest/features/home/presentation/pages/home_page_column.dart';
import 'package:alura_quest/features/homeSlider/presentation/pages/home_slider.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final bool showFirstPage;
  final double opacityLevel;

  const HomePage({
    super.key,
    required this.opacityLevel,
    required this.showFirstPage,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final charactersStore = Provider.of<CharactersStore>(
      context,
      listen: false,
    );
    charactersStore.initializeCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final charactersStore = Provider.of<CharactersStore>(context);

    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (charactersStore.isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: CircularProgressIndicator(),
              ),
            ),
          if (!charactersStore.isLoading && widget.showFirstPage)
            HomePageColumn(
              opacityLevel: widget.opacityLevel,
            ),
          if (!charactersStore.isLoading && !widget.showFirstPage)
            HomeSliderPage(
              opacityLevel: widget.opacityLevel,
            ),
        ],
      );
    });
  }
}
