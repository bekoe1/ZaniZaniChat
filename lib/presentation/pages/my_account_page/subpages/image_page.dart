import 'package:bloc_test_app/presentation/pages/my_account_page/widgets/image_carousel.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  const ImagePage(
      {super.key, required this.images, required this.initialIndex});

  final int initialIndex;
  final List<String> images;

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int _currentIndex = 0;
  double _initialPosY = 0;
  double _offsetY = 0.0;
  double _opacity = 1.0;

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: _opacity,
        backgroundColor: Colors.black12.withOpacity(_opacity),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Opacity(
            opacity: _opacity,
            child: Text(
              "${((_currentIndex) % widget.images.length + 1).round()}/${widget.images.length}",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black12.withOpacity(_opacity),
      body: GestureDetector(
        onVerticalDragStart: (details) {
          _initialPosY = details.localPosition.dy;
        },
        onVerticalDragUpdate: (details) {
          final deltaY = details.localPosition.dy - _initialPosY;
          final screenHeight = MediaQuery.of(context).size.height;
          final opacityPercent = deltaY.abs() / screenHeight / 0.2;
          final maxOffset = screenHeight * 0.5;

          setState(() {
            _offsetY = deltaY.clamp(-maxOffset, maxOffset);
            _opacity = 1.0 - opacityPercent.clamp(0.0, 1.0);
          });
        },
        onVerticalDragEnd: (details) {
          final screenHeight = MediaQuery.of(context).size.height;
          final deltaY = details.primaryVelocity! / screenHeight;
          if (deltaY.abs() > 0.3) {
            Navigator.of(context).pop();
          } else {
            setState(() {
              _offsetY = 0;
              _opacity = 1;
            });
          }
        },
        child: Transform.translate(
          offset: Offset(0,_offsetY),
          child: ImageCarousel(
            images: widget.images,
            height: 600,
            pageController: PageController(
              initialPage: widget.initialIndex,
            ),
            needTheIndicator: false,
            onPageChanged: onPageChanged,
          ),
        ),
      ),
    );
  }
}
