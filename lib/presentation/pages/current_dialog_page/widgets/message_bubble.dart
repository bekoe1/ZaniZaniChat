import 'package:bloc_test_app/presentation/pages/current_dialog_page/widgets/message_type.dart';
import 'package:flutter/material.dart';


class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message, required this.messageType,
  });

  final String message;
  final MessageType messageType;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final alignment = (messageType is MyMessage)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    final color = (messageType is MyMessage)
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.secondary;

    final textColor = (messageType is MyMessage)
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.onSecondary;

    return Align(
      alignment: alignment,
      child: Container(
        // constraints: BoxConstraints(maxWidth: size.width * 0.66),
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        child: Text(
          message ?? '',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

