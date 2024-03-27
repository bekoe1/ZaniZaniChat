import 'dart:typed_data';

import 'package:flutter/material.dart';

class DisplayedDialogWidget extends StatelessWidget {
  const DisplayedDialogWidget({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.read,
    this.profilePic,
  });

  final String name;
  final String message;
  final String time;
  final bool read;
  final String? profilePic;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            maxRadius: 30,
            child:
                profilePic != null ? Image.memory(profilePic as Uint8List) : null,
          ),
        ),
        Container(
          width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name.replaceAll("[", " ").replaceAll("]", " ").replaceAll(",", ""),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
                overflow: TextOverflow.fade,
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
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          width: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                time == "null:null" ? "-" : time,
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
          ),
        )
      ],
    );
  }
}
