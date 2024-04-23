import 'package:bloc_test_app/presentation/pages/dialogs_page/dialogs.page.dart';
import 'package:flutter/material.dart';

import '../subpages/image_page.dart';
import 'image_carousel.dart';

class ProfilePicWidget extends StatefulWidget {
  ProfilePicWidget({
    Key? key,
    required this.images,
    required this.height,
  }) : super(key: key);
  final List<String> images;
  final PageController pageController = PageController();
  final double height;

  @override
  State<ProfilePicWidget> createState() => _ProfilePicWidgetState();
}

class _ProfilePicWidgetState extends State<ProfilePicWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      expandedHeight: widget.height,
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
                  initialIndex: widget.pageController.page!.round(),
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
            pageController: widget.pageController,
            images: const [
              "https://img.freepik.com/free-photo/close-up-on-adorable-kitten-on-couch_23-2150782439.jpg",
              "https://img.freepik.com/free-photo/close-up-on-adorable-kitten-on-couch_23-2150782439.jpg",
              "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
            ],
            height: widget.height + 25,
            needTheIndicator: true,
          ),
        ),
      ),
    );
  }
}
