import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class MhCircleContainer extends StatelessWidget {
  const MhCircleContainer(  {
    super.key,
    this.width = 300,
    this.height = 300,
    this.radius = 300,
    this.padding = 0,
    this.child,
    this.backgroundColor = MhColors.light,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor),
      child: child,
    );
  }
}
