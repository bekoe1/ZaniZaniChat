import 'package:bloc_test_app/presentation/pages/dialogs_page/dialogs.page.dart';
import 'package:flutter/material.dart';

import '../subpages/image_page.dart';
import 'image_carousel.dart';

class ProfilePicWidget extends StatelessWidget {
  ProfilePicWidget({
    Key? key,
    required this.images,
    required this.height,
  }) : super(key: key);
  final List<String> images;
  final PageController pageController = PageController();
  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        )
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).popUntil(ModalRoute.withName("/DialogsPage"));
        // Navigator.pop(context);
        }
      ),
      expandedHeight: height,
      backgroundColor: Colors.white12,
      iconTheme: const IconThemeData(color: Colors.white),
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        background: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImagePage(
                  initialIndex: pageController.page!.round(),
                  images: const [
                    "https://img.freepik.com/free-photo/close-up-on-adorable-kitten-on-couch_23-2150782439.jpg",
                    "https://img.freepik.com/free-photo/close-up-on-adorable-kitten-on-couch_23-2150782439.jpg",
                    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
                  ],
                ),
              ),
            );
          },
          child: ImageCarousel(
            pageController: pageController,
            images: const [
              "https://img.freepik.com/free-photo/close-up-on-adorable-kitten-on-couch_23-2150782439.jpg",
              "https://img.freepik.com/free-photo/close-up-on-adorable-kitten-on-couch_23-2150782439.jpg",
              "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
            ],
            height: height + 25,
            needTheIndicator: true,
          ),
        ),
      ),
    );
  }
}
