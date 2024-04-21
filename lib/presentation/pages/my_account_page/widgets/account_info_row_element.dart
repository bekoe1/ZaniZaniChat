import 'package:flutter/material.dart';

class AccountInfoRowElement extends StatelessWidget {
  const AccountInfoRowElement({
    Key? key,
    required this.info,
    required this.data,
  }) : super(key: key);

  final String info;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, top: 20),
      child: Row(
        children: [
          const Icon(
            Icons.account_circle,
            color: Colors.white70,
            size: 55,
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              Text(
                data,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}