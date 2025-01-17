import 'package:alura_quest/features/auth/data/model/signUp_model.dart';
import 'package:alura_quest/features/auth/presentation/stores/auth_store.dart';
import 'package:alura_quest/features/characterCreation/presentation/widgets/textForm_field_widget.dart';
import 'package:alura_quest/features/auth/presentation/widgets/line_separate_or_widget.dart';
import 'package:alura_quest/features/myApp/presentation/pages/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _inputNameController = TextEditingController();
  final _inputEmailController = TextEditingController();
  final _inputPasswordController = TextEditingController();
  final _inputPasswordConfirmationController = TextEditingController();

  void _realTimeValidation() {
    _formKey.currentState!.validate();
    setState(() {});
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
                    "Criar conta",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Cadastre-se agora e tenha acesso as informações dos seus personagens favoritos",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormFieldWidget(
                    controller: _inputNameController,
                    labelText: 'Nome',
                    hintText: 'Insira o seu nome',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Insira o seu nome';
                      }

                      return null;
                    },
                    onChanged: _realTimeValidation,
                  ),
                  const SizedBox(
                    height: 16,
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
                  TextFormFieldWidget(
                    controller: _inputPasswordConfirmationController,
                    labelText: 'Confirme a senha',
                    hintText: 'Confirme a senha',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirme a senha';
                      }
                      return null;
                    },
                    onChanged: _realTimeValidation,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(builder: (_) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          SignUpModel dataSignUp = SignUpModel(
                            username: _inputNameController.text,
                            email: _inputEmailController.text,
                            password: _inputPasswordController.text,
                            rePassword:
                                _inputPasswordConfirmationController.text,
                          );

                          bool isSuccess = await authStore.signUp(dataSignUp);
                          if (isSuccess) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const MyApp(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Erro ao criar usuário."),
                              ),
                            );
                          }
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
                              "Criar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                    );
                  }),
                  const LineSeparateOrWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Já tem uma conta?"),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Acessar",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
