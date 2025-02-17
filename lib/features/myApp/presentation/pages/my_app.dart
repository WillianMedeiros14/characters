import 'package:alura_quest/features/characterCreation/presentation/stores/characters_store.dart';
import 'package:alura_quest/features/home/presentation/pages/home_page.dart';
import 'package:alura_quest/features/home/presentation/pages/search.dart';
import 'package:alura_quest/features/homeSlider/presentation/pages/home_slider.page.dart';
import 'package:alura_quest/features/auth/presentation/pages/login_page.dart';
import 'package:alura_quest/features/auth/presentation/stores/auth_store.dart';
import 'package:alura_quest/features/profile/presentation/pages/profile_Page.dart';
import 'package:alura_quest/shared/widgets/floating_action_button_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showFirstPage = true;
  final controllerSearchInput = TextEditingController();

  _togglePage(bool value) {
    setState(() {
      _showFirstPage = value;
    });
  }

  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final loginStore = Provider.of<AuthStore>(context);

    final characterStore = Provider.of<CharactersStore>(context);

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Observer(
        builder: (_) {
          if (loginStore.isLogged) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 16,
                          right: 16,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                "Crie, explore e se conecte com personagens incríveis!",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap: true,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Builder(
                              builder: (BuildContext context) {
                                return ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfilePage(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: const CircleBorder(),
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      'https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096',
                                      width: 75,
                                      height: 75,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                          right: 16,
                          left: 16,
                          top: 20,
                        ),
                        child: Search(
                          controllerSearchInput: controllerSearchInput,
                          onSearch: (value) {
                            characterStore.searchCharacters(searchValue: value);
                          },
                        ),
                      ),
                      HomePage(
                        opacityLevel: opacityLevel,
                        showFirstPage: _showFirstPage,
                      )
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButtonOptionWidget(
                onChangeOpacity: _changeOpacity,
                opacityLevel: opacityLevel,
                onTogglePageList: _togglePage,
                onTogglePageSlider: _togglePage,
                isCollumn: _showFirstPage,
              ),
            );
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
