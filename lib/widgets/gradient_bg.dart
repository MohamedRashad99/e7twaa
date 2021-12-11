import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  GradientBackground({this.child, this.padding});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: child,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/backG.png'),
             fit: BoxFit.fill
      )),
    );
  }
}
