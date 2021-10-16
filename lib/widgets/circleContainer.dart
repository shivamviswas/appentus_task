import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  double? height, padding;
  Widget? child;
  Color? color;

  CircleContainer(
      {required this.height,this.padding,this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: ShapeDecoration(color: color, shape: CircleBorder()),
      height: height,
      width: height,
      child: child,
    );
  }
}
