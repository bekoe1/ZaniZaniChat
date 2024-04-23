import 'package:bloc_test_app/presentation/pages/dialogs_page/dialogs.page.dart';
import 'package:bloc_test_app/presentation/pages/my_account_page/bloc/my_account_bloc.dart';
import 'package:bloc_test_app/presentation/pages/my_account_page/subpages/fio_change_page.dart';
import 'package:bloc_test_app/presentation/pages/my_account_page/subpages/image_page.dart';
import 'package:bloc_test_app/presentation/pages/my_account_page/subpages/username_change_page.dart';
import 'package:bloc_test_app/presentation/pages/my_account_page/widgets/account_info_row_element.dart';
import 'package:bloc_test_app/presentation/pages/my_account_page/widgets/image_carousel.dart';
import 'package:bloc_test_app/presentation/pages/my_account_page/widgets/profile_pic_widget.dart';
import 'package:bloc_test_app/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/datasources/auth_data_source.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  double height = 300;
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyAccountBloc()..add(FetchAccountInfoEvent()),
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          final newHeight = height + details.delta.dy;
          if (newHeight >= 300 && newHeight <= 600) {
            setState(() => height = newHeight);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white12,
          body: BlocBuilder<MyAccountBloc, MyAccountState>(
            builder: (context, state) {
              return CustomScrollView(
                controller: controller,
                slivers: [
                  // if (state is MyAccDataFetched)
                  ProfilePicWidget(
                    images: [],
                    height: height,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return BlocBuilder<MyAccountBloc, MyAccountState>(
                          builder: (context, state) {
                            if (state is MyAccDataFetched) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FioChangePage()));
                                      },
                                      child: Text(
                                        state.data!.name.isEmpty &&
                                                state.data!.surname.isEmpty
                                            ? "Нажмите здесь, чтобы ввести имя и фамилию"
                                            : "${state.data!.name} ${state.data!.surname}",
                                        style: state.data!.name.isEmpty &&
                                                state.data!.surname.isEmpty
                                            ? const TextStyle(
                                                color: Colors.white54,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300,
                                              )
                                            : const TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      child: AccountInfoRowElement(
                                        info: "Username",
                                        data: state.data!.username,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UsernameChangePage()),
                                        );
                                      },
                                    ),
                                    AccountInfoRowElement(
                                      info: "Email",
                                      data: state.data!.email.adress.toString(),
                                    ),
                                    const SizedBox(height: 30),
                                    GestureDetector(
                                      child: AccountInfoRowElement(
                                        info: "Username",
                                        data: state.data!.username,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UsernameChangePage()),
                                        );
                                      },
                                    ),
                                    AccountInfoRowElement(
                                      info: "Email",
                                      data: state.data!.email.adress.toString(),
                                    ),
                                    GestureDetector(
                                      child: AccountInfoRowElement(
                                        info: "Username",
                                        data: state.data!.username,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UsernameChangePage()),
                                        );
                                      },
                                    ),
                                    AccountInfoRowElement(
                                      info: "Email",
                                      data: state.data!.email.adress.toString(),
                                    ),
                                    GestureDetector(
                                      child: AccountInfoRowElement(
                                        info: "Username",
                                        data: state.data!.username,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UsernameChangePage()),
                                        );
                                      },
                                    ),
                                    AccountInfoRowElement(
                                      info: "Email",
                                      data: state.data!.email.adress.toString(),
                                    ),
                                    CustomElevatedButton(
                                      bckgroundColor: Colors.grey,
                                      fontSize: 22,
                                      func: () {
                                        // WebSocketRepo().disconnect();
                                        AuthDataSource().logOut();
                                      },
                                      text: "LogOut",
                                      textColor: Colors.black,
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
