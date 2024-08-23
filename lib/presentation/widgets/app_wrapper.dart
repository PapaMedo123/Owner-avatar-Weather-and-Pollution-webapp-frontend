import 'package:flutter/material.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;
  final double padding;
  final double? height;
  final double? width;
  const AppWrapper({
    super.key,
    required this.child,
    required this.padding,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      constraints: BoxConstraints.expand(height: height, width: width),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: child,
    );
  }
}
