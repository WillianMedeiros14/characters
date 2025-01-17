import 'package:alura_quest/features/auth/presentation/stores/auth_store.dart';
import 'package:alura_quest/features/myApp/presentation/pages/my_app.dart';
import 'package:alura_quest/shared/widgets/line_vertical.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/9195/9195970.png',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            // Text(
            //   authStore.user!.userName,
            //   style: const TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const SizedBox(
              height: 30,
            ),
            ButtonOptionsProfile(
              title: "Dados pessoais",
              icon: Icons.person_2_rounded,
              onPressed: () => {},
            ),
            ButtonOptionsProfile(
              title: "Configigurações",
              icon: Icons.settings_rounded,
              onPressed: () => {},
            ),
            const LineVertical(),
            ButtonOptionsProfile(
              title: "Sair",
              icon: Icons.logout_rounded,
              colorIcon: Colors.red,
              onPressed: () async => {
                await authStore.logOut(),
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ),
                  (Route<dynamic> route) => false,
                )
              },
            )
          ],
        ),
      ),
    );
  }
}

class ButtonOptionsProfile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final Color colorIcon;

  const ButtonOptionsProfile({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.colorIcon = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 35,
            color: colorIcon,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right,
            size: 20,
          ),
        ],
      ),
    );
  }
}
