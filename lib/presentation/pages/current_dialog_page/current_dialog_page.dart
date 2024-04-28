import 'dart:developer';

import '../../../domain/models/message_dto.dart';
import 'package:bloc_test_app/domain/repo/web_socket_repo.dart';
import 'package:bloc_test_app/presentation/pages/current_dialog_page/widgets/message_bubble.dart';
import 'package:bloc_test_app/presentation/pages/current_dialog_page/widgets/message_type.dart';
import 'package:bloc_test_app/utils/textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/current_chat_bloc.dart';

class CurrentDialogPage extends StatefulWidget {
  const CurrentDialogPage({
    super.key,
    this.chatId,
    this.userId,
    required this.anotherUserName,
  });

  final String anotherUserName;
  final String? chatId;
  final String? userId;

  @override
  State<CurrentDialogPage> createState() => _CurrentDialogPageState();
}

class _CurrentDialogPageState extends State<CurrentDialogPage> {
  final TextEditingController messageController = TextEditingController();
  final wsRepo = WebSocketRepo();
  final scrollController = ScrollController();

  @override
  void initState() {
    wsRepo.initializeMessageControllers();
    wsRepo.messageController.stream.listen((event) {
      context.read<CurrentChatBloc>().add(MessageReceivedEvent(message: event));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CurrentChatBloc()
        ..add(CurrentChatDataFetchingEvent(
          chatId: widget.chatId,
          userId: widget.userId,
          page: 1,
        )),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.white12,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(),
              const SizedBox(
                width: 50,
              ),
              Text(
                widget.anotherUserName,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white12,
        body: BlocBuilder<CurrentChatBloc, CurrentChatState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      messageController.text = messageController.text.trim();
                      FocusScope.of(context).unfocus();
                    },
                    child: state.messages.isNotEmpty
                        ? ListView.builder(
                            controller: scrollController,
                            itemBuilder: (context, index) {
                              if (state is CurrentChatFound &&
                                  state.messages.isNotEmpty) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: MessageBubble(
                                    message: state.messages[index].data,
                                    messageType: state.messages[index].sender ==
                                            state.myId
                                        ? MyMessage()
                                        : NotMyMessage(),
                                  ),
                                );
                              }
                              //   return const Center(
                              //     child: Text(
                              //       "Начните диалог первым, отправив сообщение",
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //         fontSize: 20,
                              //       ),
                              //       textAlign: TextAlign.center,
                              //     ),
                              //   );
                              // },
                            },
                            itemCount: state.messages.length,
                          )
                        : const Center(
                          child: Text(
                              "Начните диалог первым, отправив сообщение",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
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
                  controller: messageController,
                  rightAction: () {
                    context.read<CurrentChatBloc>().add(
                          MessageSendEvent(message: messageController.text),
                        );
                    FocusScope.of(context).unfocus();
                    if(scrollController.hasClients) {
                      scrollController.animateTo(
                        scrollController.position.maxScrollExtent - 20,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                    messageController.clear();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
