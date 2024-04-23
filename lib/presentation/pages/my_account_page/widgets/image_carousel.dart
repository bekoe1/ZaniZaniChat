import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;
  final double height;
  final PageController pageController;
  final bool needTheIndicator;
  final void Function(int index)? onPageChanged;

  ImageCarousel({
    Key? key,
    required this.images,
    required this.height,
    required this.pageController,
    required this.needTheIndicator,
    this.onPageChanged,
  }) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            onPageChanged: (index) {
              widget.onPageChanged != null
                  ? widget.onPageChanged!(index)
                  : null;
            },
            controller: widget.pageController,
            itemBuilder: (context, index) {
              return PhotoView(
                initialScale: PhotoViewComputedScale.contained,
                imageProvider:
                    NetworkImage(widget.images[index % widget.images.length]),
              );
            },
          ),
        ),
        if (widget.needTheIndicator)
          Positioned(
            bottom: 15,
            left: 21.54,
            child: SmoothPageIndicator(
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.grey,
                dotHeight: 7,
                dotWidth:
                    MediaQuery.of(context).size.width / widget.images.length -
                        20,
                expansionFactor: 1.01,
              ),
              controller: widget.pageController,
              count: widget.images.length,
            ),
          )
        else
          const Placeholder(color: Colors.transparent),
      ],
    );
  }
}
