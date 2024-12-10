import 'package:flutter/material.dart';

class ChangeCharacterHitPointButton extends StatelessWidget {
  final IconData iconButton;
  final VoidCallback onPressed;
  const ChangeCharacterHitPointButton(
      {super.key, required this.iconButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 127, 129, 130),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconButton,
          color: Colors.white,
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
