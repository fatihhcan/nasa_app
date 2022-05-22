import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;
  const CustomBox({Key? key, this.onTap, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }
}
