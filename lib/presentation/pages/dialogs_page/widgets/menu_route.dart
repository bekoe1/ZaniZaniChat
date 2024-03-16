// import 'package:flutter/material.dart';
//
// class SlideMenuRoute extends PageRouteBuilder {
//   final Widget page;
//
//   SlideMenuRoute({required this.page})
//       : super(
//           transitionDuration: const Duration(milliseconds: 300),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             var begin = const Offset(-1.0, 0.0);
//             var end = const Offset(0.0, 0.0);
//             var tween = Tween(begin: begin, end: end)
//                 .chain(CurveTween(curve: Curves.bounceOut));
//
//             var offsetAnimation = animation.drive(tween);
//
//             return SlideTransition(
//               position: offsetAnimation,
//               child: child,
//             );
//           },
//           pageBuilder: (context, animation, secondaryAnimation) {
//             return SafeArea(
//               right: true,
//               minimum: const EdgeInsets.only(right: 100),
//               child: page,
//             );
//           },
//         );
// }
