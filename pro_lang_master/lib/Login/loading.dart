import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFF826FA9),
      child: Center(
        child: LoadingAnimationWidget.horizontalRotatingDots(
          color: Colors.white,
          size: 200,
        ),
      ),
    );
  }
}
