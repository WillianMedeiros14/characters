import 'package:alura_quest/features/characterCreation/presentation/widgets/textForm_field_widget.dart';
import 'package:alura_quest/features/login/presentation/pages/sign_up_dart.dart';
import 'package:alura_quest/features/login/presentation/widgets/line_separate_or_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _inputEmailController = TextEditingController();
  final _inputPasswordController = TextEditingController();

  void _realTimeValidation() {
    _formKey.currentState!.validate();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 230,
                    child: SvgPicture.asset(
                      'assets/images/login.svg',
                      semanticsLabel: 'Dart Logo',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Bem-vindo",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Tenha informaçoes sobre os seus personagems favoritos",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormFieldWidget(
                    controller: _inputEmailController,
                    labelText: 'E-mail',
                    hintText: 'Insira o e-mail',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Insira o e-mail';
                      }

                      final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegExp.hasMatch(value)) {
                        return 'Insira um e-mail válido';
                      }
                      return null;
                    },
                    onChanged: _realTimeValidation,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormFieldWidget(
                    controller: _inputPasswordController,
                    labelText: 'Senha',
                    hintText: 'Insira a senha',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Insira a senha';
                      }
                      return null;
                    },
                    onChanged: _realTimeValidation,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () => {},
                      child: const Text(
                        "Esqueceu a senha?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 25, 149, 81),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                    child: const Text(
                      "Acessar",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const LineSeparateOrWidget(),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
