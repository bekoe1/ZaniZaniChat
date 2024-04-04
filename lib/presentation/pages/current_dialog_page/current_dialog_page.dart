
import 'package:bloc_test_app/presentation/pages/current_dialog_page/bloc/current_chat_bloc.dart';
import 'package:bloc_test_app/presentation/pages/current_dialog_page/widgets/message_bubble.dart';
import 'package:bloc_test_app/presentation/pages/current_dialog_page/widgets/message_type.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:bloc_test_app/utils/textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentDialog extends StatefulWidget {
  CurrentDialog({
    super.key,
    required this.name,
    required this.userId,
  });
  final String name;
  final String userId;
  @override
  State<CurrentDialog> createState() => _CurrentDialogState();
}

class _CurrentDialogState extends State<CurrentDialog> {
  final TextEditingController messageController = TextEditingController();
  final Future<String?> id =  SharedPrefsHelper.GetProfileId();
  ///test
  // late List<String> messages = [];

  // void addMessage() {
  //   setState(() {
  //     messages.add(messageController.text);
  //   });
  // }

  //
  // @override
  // void initState() {
  //   WebSocketRepo().initializeMessageControllers();
  //   MessageRepo().subscribeToMessageUpdates((message) {
  //     messages.add(message.messageInfo!.messageData!);
  //   });
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   MessageRepo().unSubscribeToMessageUpdates();
  //   super.dispose();
  // }

  ///test
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentChatBloc()
        ..add(InitialDataFetchingEvent(userId: widget.userId)),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white12,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Row(
                children: [
                  const CircleAvatar(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: BlocBuilder<CurrentChatBloc, CurrentChatState>(
          builder: (context, state) {
            // List<MessageFromApiModel>? messages = state.messages;
            return Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: BlocBuilder<CurrentChatBloc, CurrentChatState>(
                      builder: (context, state) {
                        if (state is CurrentChatExists || state is MessageSendEvent) {
                          return ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            itemCount: state.messages?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: MessageBubble(
                                  message: state.messages?.reversed
                                      .toList()[index]
                                      .data!
                                      .trim() ?? "",

                                  messageType: /*todo message check*/
                                      state.messages?[index].sender != widget.userId ? MyMessage()
                                          : NotMyMessage(),

                                  time:  state.messages?[index].time ?? DateTime.now(),
                                ),
                              );
                            },
                          );
                        } else if (state is CurrentChatDoesNotExist) {
                          return const Center(
                            child: Text(
                              "Отправьте сообщение, чтобы начать диалог",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          ));
                        }
                      },
                    ),
                  ),
                ),
                CustomTextFormField(
                  suffixIcon: Icons.send,
                  action: () async {
                    if (state is CurrentChatDoesNotExist) {
                      //sending logic
                      // messages.add(messageController.text);
                      context.read<CurrentChatBloc>().add(
                            FirstMessageSendEvent(
                              message: messageController.text,
                              userId: widget.userId,
                            ),
                          );
                    } else {
                      // messages.add(messageController.text);
                      // log(messageController.text);
                      context.read<CurrentChatBloc>().add(
                            MessageSendEvent(
                              message: messageController.text,
                              userId: widget.userId,
                            ),
                          );
                      // );
                    }

                    // addMessage();
                    FocusScope.of(context).unfocus();
                    messageController.text = "";
                  },
                  inputType: TextInputType.multiline,
                  obscuringPass: false,
                  width: double.infinity,
                  fillColor: Colors.grey,
                  filled: true,
                  maxLines: 3,
                  controller: messageController,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
