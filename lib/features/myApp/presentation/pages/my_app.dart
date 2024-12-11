import 'package:alura_quest/features/home/presentation/pages/home_page.dart';
import 'package:alura_quest/features/homeSlider/presentation/pages/home_slider.page.dart';
import 'package:alura_quest/features/myApp/presentation/widgets/modal_to_change_page_type_widget.dart';
import 'package:alura_quest/shared/widgets/floating_action_button_option_widget.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
    return MaterialApp(
      title: 'Alura Quest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: _showFirstPage ? const HomePage() : const HomeSliderPage(),
        floatingActionButton: FloatingActionButtonOptionWidget(
          onChangeOpacity: _changeOpacity,
          opacityLevel: opacityLevel,
          onTogglePageList: _togglePage,
          onTogglePageSlider: _togglePage,
          isCollumn: _showFirstPage,
        ),
      ),
    );
  }
}
