import 'dart:developer';

import 'package:bloc_test_app/domain/models/dialogs.dart';
import 'package:bloc_test_app/presentation/pages/current_dialog_page/current_dialog_page.dart';
import 'package:bloc_test_app/presentation/pages/dialogs_page/bloc/dialogs_bloc.dart';
import 'package:bloc_test_app/presentation/pages/dialogs_page/widgets/drawer.dart';
import 'package:bloc_test_app/presentation/pages/search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'widgets/displayed_dialogs.dart';

class DialogsPage extends StatefulWidget {
  //сделать,чтобы принимал id
  const DialogsPage({super.key});

  @override
  State<DialogsPage> createState() => _DialogsPageState();
}

class _DialogsPageState extends State<DialogsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DialogsBloc()..add(FetchDialogsEvent(page: 0)),
      child: BlocBuilder<DialogsBloc, DialogsState>(builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white12,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchPage()),
                  );
                  // DialogsRepo.getNumberOfDialogPages();
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
            ],
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color:
                    _isDrawerOpen == true ? Colors.transparent : Colors.white,
              ),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          drawer: DrawerWidget(callback: (isOpen) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                _isDrawerOpen = isOpen;
              });
            });
          }),
          body: RefreshIndicator(
            displacement: 10,
            onRefresh: () async {
              (context).read<DialogsBloc>().add(FetchDialogsEvent(page: 0));
            },
            child: ListView.builder(
                itemCount: state.dialogs?.length ?? 0,
                itemBuilder: (context, index) {
                  if (state is FetchedDialogsState) {
                    List<DialogsData> dialogs = state.dialogs;
                    return SizedBox.fromSize(
                      size: MediaQuery.of(context).size,
                      child: Column(
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CurrentDialogPage(
                                        chatId: state.dialogs[index].id,
                                        anotherUserName: state.dialogs[index].name,
                                      ),
                                    ),
                                  );
                                },
                                child: DisplayedDialogWidget(
                                    name: state.dialogs[index].name.toString(),
                                    message: state.dialogs[index].lastMessage
                                                .data !=
                                            ""
                                        ? state.dialogs[index].lastMessage.data
                                        : "chat created",
                                    time:
                                        "${state.dialogs[index].lastMessage.time.hour.toString().padLeft(2, '0')}:${state.dialogs[index].lastMessage.time.minute.toString().padLeft(2, '0')}",
                                    read:
                                        state.dialogs[index].lastMessage.read),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is DialogsInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is NoDialogsState) {
                    return const Center(
                      child: Text(
                        "Для поиска собеседника нажмите 'Поиск'",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    return const Center(
                        child: Text(
                      "Ошибка",
                      style: TextStyle(color: Colors.white),
                    ));
                  }
                }),
          ),
        );
      }),
    );
  }
}
