import 'dart:math';

import 'package:flutter/material.dart';

class DecoRotate extends StatefulWidget {
  const DecoRotate({super.key});

  @override
  State<DecoRotate> createState() => _DecoRotateState();
}

class _DecoRotateState extends State<DecoRotate> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.rotate(
        angle: controller.value * 2 * pi,
        child: CircularProgressIndicator(
          value: controller.value,
          strokeWidth: 10,
          valueColor: controller
              .drive(ColorTween(begin: Colors.cyan, end: Colors.deepPurple)),
        ),
      ),
    );
  }
}
