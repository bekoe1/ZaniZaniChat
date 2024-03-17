import 'package:flutter/material.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
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
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: PageView.builder(
                onPageChanged: (num){
                  setState(() {
                    currentIndex = num;
                  });
                },
                  controller: pageController,
                  itemCount: 3,//todo столько, сколько в листе
                  itemBuilder: (context, index) {
                    currentIndex = index;
                    return const Placeholder(
                      color: Colors.red,
                    );
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        index == currentIndex ? Colors.white : Colors.blueGrey,
                  ),
                ),
              );
            }),
          ),
          //todo name|email info
        ],
      ),
    );
  }
}

