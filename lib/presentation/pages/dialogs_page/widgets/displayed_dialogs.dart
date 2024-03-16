import 'package:flutter/material.dart';

class DisplayedDialogWidget extends StatelessWidget {
  const DisplayedDialogWidget({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.read,
  });

  final String name;
  final String message;
  final String time;
  final bool read;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          maxRadius: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            Text(
              message,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            )
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              time,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            read == false
                ? const Icon(
              Icons.lens,
              color: Colors.grey,
              size: 15,
            )
                : const SizedBox(),
          ],
        )
      ],
    );
  }
}
