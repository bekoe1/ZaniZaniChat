import 'package:bloc_test_app/domain/dialog_model.dart';
import 'package:bloc_test_app/presentation/pages/dialogs_page/bloc/dialogs_bloc.dart';
import 'package:bloc_test_app/utils/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'displayed_dialogs.dart';

class DialogsPage extends StatefulWidget {
  //сделать,чтобы принимал id
  const DialogsPage({super.key});

  @override
  State<DialogsPage> createState() => _DialogsPageState();
}

class _DialogsPageState extends State<DialogsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DialogsBloc()..add(FetchDialogsEvent(0)),
      child: BlocBuilder<DialogsBloc, DialogsState>(
        builder: (context, state) {
          if (state is FetchedDialogsState) {
            List<DialogModel>? dialogs = state.dialogs.dialogs;
            return Scaffold(
              backgroundColor: Colors.white12,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              drawer: DrawerWidget(name: state.dialogs.dialogs[0].sender),
              body: ListView.builder(
                itemCount: state.dialogs.dialogs.length ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (BuildContext context) {
                                //  todo delete method
                              },
                              icon: Icons.delete,
                              spacing: 1,
                              autoClose: true,
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.black,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: GestureDetector(
                            onTap: () {
                              // Обработка нажатия на диалог
                              (context).read<DialogsBloc>().add(
                                  DeleteMessageEvent(
                                      chatId:
                                          state.dialogs.dialogs[index].chatId));
                            },
                            child: DisplayedDialogWidget(
                              name: state.dialogs.dialogs[index].dialogsDtoWith
                                  .username,
                              message: state.dialogs.dialogs[index].message,
                              time:
                                  "${state.dialogs.dialogs[index].time.hour.toString().padLeft(2, '0')}:${state.dialogs.dialogs[index].time.minute.toString().padLeft(2, '0')}",
                              read: state.dialogs.dialogs[index].read,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          } else if (state is DialogsInitial) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
                child: Text(
              "Ошибка",
              style: TextStyle(color: Colors.white),
            ));
          }
        },
      ),
    );
  }
}
