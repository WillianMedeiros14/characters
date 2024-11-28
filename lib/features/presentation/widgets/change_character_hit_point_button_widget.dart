import 'package:flutter/material.dart';

class ChangeCharacterHitPointButton extends StatelessWidget {
  final IconData iconButton;
  const ChangeCharacterHitPointButton({super.key, required this.iconButton});

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
        onPressed: () {},
        icon: Icon(
          iconButton,
          color: Colors.white,
        ),
        padding: EdgeInsets.zero,
      ),
    );
    ;
  }
}
