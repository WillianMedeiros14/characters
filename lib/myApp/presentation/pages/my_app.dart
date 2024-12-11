import 'package:alura_quest/features/home/presentation/pages/home_page.dart';
import 'package:alura_quest/features/homeSlider/presentation/pages/home_slider.page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showFirstPage = true;

  void _togglePage() {
    setState(() {
      _showFirstPage = !_showFirstPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Alternar Páginas'),
          actions: [
            IconButton(
              icon: const Icon(Icons.swap_horiz),
              onPressed: _togglePage,
            ),
          ],
        ),
        body: _showFirstPage
            ? const HomePage(
                title: 'Alura Quest',
              )
            : const HomeSliderPage(),
      ),
    );
  }
}
