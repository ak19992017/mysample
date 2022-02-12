import 'dart:math';
import 'package:flutter/material.dart';

class MyStaggeredAnimation extends StatefulWidget {
  const MyStaggeredAnimation({Key? key}) : super(key: key);

  @override
  _MyStaggeredAnimationState createState() => _MyStaggeredAnimationState();
}

class _MyStaggeredAnimationState extends State<MyStaggeredAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation sizeAnimation;
  late Animation colorAnimation;
  late Animation rotateAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    sizeAnimation = Tween(begin: 100.0, end: 300.0)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.4)));

    colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.4, 0.7)));

    rotateAnimation = Matrix4Tween(
            begin: Matrix4.rotationZ(0), end: Matrix4.rotationZ(pi))
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.7, 1)));

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staggered Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: sizeAnimation.value,
          width: sizeAnimation.value,
          color: colorAnimation.value,
          transform: rotateAnimation.value,
        ),
      ),
    );
  }
}
