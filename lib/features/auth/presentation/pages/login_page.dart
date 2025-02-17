import 'package:alura_quest/features/characterCreation/presentation/widgets/textForm_field_widget.dart';
import 'package:alura_quest/features/auth/data/model/login_model.dart';
import 'package:alura_quest/features/auth/presentation/pages/sign_up_dart.dart';
import 'package:alura_quest/features/auth/presentation/stores/auth_store.dart';
import 'package:alura_quest/features/auth/presentation/widgets/line_separate_or_widget.dart';

import 'package:alura_quest/shared/data/interceptors/config/dio_interceptor.dart';
import 'package:alura_quest/shared/data/interceptors/functions/dio_http_log_interceptor.dart';
import 'package:alura_quest/shared/widgets/info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _inputEmailController = TextEditingController();
  final _inputPasswordController = TextEditingController();

  late DioHttpLogInterceptor loggerInterceptor;
  late DioInterceptors dioInterceptors;

  void _realTimeValidation() {
    _formKey.currentState!.validate();
    setState(() {});
  }

  void _infoModal() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const InfoDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = Provider.of<AuthStore>(
      context,
      listen: false,
    );

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
                      onPressed: () => {_infoModal()},
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        LoginModel dataLogin = LoginModel(
                          email: _inputEmailController.text,
                          password: _inputPasswordController.text,
                        );

                        await authStore.login(dataLogin);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 25, 149, 81),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                    child: authStore.isLoading
                        ? const CircularProgressIndicator()
                        : const Text(
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
