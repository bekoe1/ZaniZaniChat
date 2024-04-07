import 'package:bloc_test_app/presentation/pages/dialogs_page/dialogs.page.dart';
import 'package:bloc_test_app/presentation/pages/my_account_page/bloc/my_account_bloc.dart';
import 'package:bloc_test_app/presentation/pages/my_account_page/subpages/fio_change_page.dart';
import 'package:bloc_test_app/presentation/pages/my_account_page/subpages/username_change_page.dart';
import 'package:bloc_test_app/utils/buttons.dart';
import 'package:bloc_test_app/utils/network/constants.dart';
import 'package:bloc_test_app/utils/textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasources/auth_data_source.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyAccountBloc()..add(FetchAccountInfoEvent()),
      child: Scaffold(
        backgroundColor: Colors.white12,
        body: BlocBuilder<MyAccountBloc, MyAccountState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                if (state is MyAccDataFetched)
                  ProfilePicWidget(images: state.data!.profilePhotos),
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
    );
  }
}

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

class ProfilePicWidget extends StatefulWidget {
  ProfilePicWidget({
    Key? key,
    required this.images,
  }) : super(key: key);
  final List<String> images;

  @override
  State<ProfilePicWidget> createState() => _ProfilePicWidgetState();
}

class _ProfilePicWidgetState extends State<ProfilePicWidget> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DialogsPage()),
          );
        },
      ),
      expandedHeight: 300,
      backgroundColor: Colors.white12,
      iconTheme: const IconThemeData(color: Colors.white),
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        background: Column(
          children: [
            Center(
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: PageView.builder(
                  onPageChanged: (num) {
                    setState(() {
                      currentIndex = num;
                    });
                  },
                  controller: pageController,
                  itemCount:
                      widget.images.isNotEmpty ? widget.images.length : 1,
                  itemBuilder: (context, index) {
                    currentIndex = index;
                    if (widget.images.isNotEmpty) {
                      return const Placeholder(
                        color: Colors.red,
                      );
                    } else {
                      return OtherConstants().accountCircle;
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.images.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == currentIndex
                              ? Colors.white
                              : Colors.blueGrey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
