import 'package:flutter/material.dart';

class StrengthStartWidget extends StatelessWidget {
  final int strength;
  const StrengthStartWidget({super.key, required this.strength});

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
            size: 15,
          );
        },
      ),
    );
  }
}
