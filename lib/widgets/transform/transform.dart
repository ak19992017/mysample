import 'package:flutter/material.dart';

class MyTransform extends StatefulWidget {
  const MyTransform({Key? key}) : super(key: key);

  @override
  _MyTransformState createState() => _MyTransformState();
}

class _MyTransformState extends State<MyTransform>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotationAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    rotationAnimation = Tween<double>(begin: 0, end: 3.14).animate(controller);

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform'),
        centerTitle: true,
      ),
      body: Center(
        child: Transform.rotate(
          angle: rotationAnimation.value,
          child: Container(
            color: Colors.blue,
            height: 200.0,
            width: 200.0,
          ),
        ),
      ),
    );
  }
}
