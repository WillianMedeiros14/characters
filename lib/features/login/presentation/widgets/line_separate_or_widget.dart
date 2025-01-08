import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LineSeparateOrWidget extends StatelessWidget {
  const LineSeparateOrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: Color.fromARGB(255, 162, 158, 158),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "ou",
                style: TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: Color.fromARGB(255, 162, 158, 158),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
