import 'package:flutter/material.dart';

class StrengthStartWidget extends StatelessWidget {
  final int strength;
  final double sizeIcon;
  const StrengthStartWidget(
      {super.key, required this.strength, this.sizeIcon = 15});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) {
          Color starColor;
          if (index < strength) {
            starColor = Colors.amber;
          } else {
            starColor = Colors.grey;
          }

          return Icon(
            Icons.star,
            color: starColor,
            size: sizeIcon,
          );
        },
      ),
    );
  }
}
