import 'package:flutter/material.dart';

class InformationsCard extends StatelessWidget {
  const InformationsCard({
    super.key,
    required this.information,
    this.icon,
    this.image,
  });

  final String information;
  final IconData? icon;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(
        minWidth: 80,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.amberAccent.shade700,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Image(
                    image: image!,
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  )
                : Icon(
                    icon,
                    size: 30,
                  ),
            Text(
              information,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
