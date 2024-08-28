
import 'package:flutter/material.dart';

class CommonBackground extends StatelessWidget {
  final Widget child;
  CommonBackground({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/background.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        child
      ],
    );
  }
}
