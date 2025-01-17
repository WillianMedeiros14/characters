import 'package:alura_quest/features/home/presentation/pages/home_page.dart';
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

    return MaterialApp(
      title: 'Alura Quest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Observer(
        builder: (_) {
          if (loginStore.isLogged) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        );
                      },
                      icon: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 0,
                          ),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: _showFirstPage
                  ? HomePage(opacityLevel: opacityLevel)
                  : HomeSliderPage(opacityLevel: opacityLevel),
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
