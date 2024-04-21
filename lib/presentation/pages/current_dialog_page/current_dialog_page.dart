import 'package:bloc_test_app/presentation/pages/current_dialog_page/widgets/message_bubble.dart';
import 'package:bloc_test_app/presentation/pages/current_dialog_page/widgets/message_type.dart';
import 'package:bloc_test_app/utils/textfields.dart';
import 'package:flutter/material.dart';

class CurrentDialogPage extends StatefulWidget {
  const CurrentDialogPage({super.key, this.chatId, this.userid});
  final String? chatId;
  final String? userid;
  @override
  State<CurrentDialogPage> createState() => _CurrentDialogPageState();
}

class _CurrentDialogPageState extends State<CurrentDialogPage> {
  List<dynamic> messages = ["", "", "", ""];
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.white12,
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(),
            SizedBox(
              width: 50,
            ),
            Text(
              "Test",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white12,
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                messageController.text = messageController.text.trim();
                FocusScope.of(context).unfocus();
              },
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: MessageBubble(
                      message: "test",
                      messageType: MyMessage(),
                    ),
                  );
                },
                itemCount: messages.length,
              ),
            ),
          ),
          CustomTextFormField(
            obscuringPass: false,
            width: double.infinity,
            inputType: TextInputType.multiline,
            filled: true,
            fillColor: Colors.white54,
            leftIcon: Icons.image,
            iconColor: Colors.black38,
            rightIcon: Icons.send,
            inputAction: TextInputAction.newline,
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
