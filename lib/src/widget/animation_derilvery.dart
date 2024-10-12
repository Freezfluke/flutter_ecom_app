import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLoading extends StatelessWidget {
  final String iconRender;
  final double? width;
  final double? height;
  const AnimationLoading(
      {super.key,
      required this.iconRender,
      this.width = 300,
      this.height = 200});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(iconRender,
            width: width, height: height, fit: BoxFit.fill));
  }
}
