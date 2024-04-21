import 'dart:developer';

import 'package:bloc_test_app/utils/network/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;
  final double height;

  const ImageCarousel(
      {super.key,
      required this.images,
      required this.pageController,
      required this.height});

  final PageController pageController;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.height,
          width: double.infinity,
          child: PageView.builder(
            onPageChanged: (num) {
              setState(() {
                currentIndex = pageController.page!.round();
                log(pageController.page!.round().toString());
              });
            },
            controller: pageController,
            itemCount: widget.images.isNotEmpty ? widget.images.length : 1,
            itemBuilder: (context, index) {
              // currentIndex = index;
              if (widget.images.isEmpty) {
                return GestureDetector(
                  onTap: () {},
                  child: Image.network(
                    OtherConstants.accountCircle,
                    fit: BoxFit.cover,
                  ),
                );
              }
              return Image.network(
                widget.images[currentIndex],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Center(
            child: SmoothPageIndicator(
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.indigo
              ),
              controller: pageController,
              count: 3,
            ),
          ),
        ),
      ],
    );
  }
}
