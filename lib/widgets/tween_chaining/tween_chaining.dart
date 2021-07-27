import 'package:flutter/material.dart';

class MyTweenChaining extends StatefulWidget {
  const MyTweenChaining({Key? key}) : super(key: key);

  @override
  _MyTweenChainingState createState() => _MyTweenChainingState();
}

class _MyTweenChainingState extends State<MyTweenChaining>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    sizeAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 100.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 100.0, end: 50.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 50.0, end: 75.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 75.0, end: 0.0), weight: 1),
      ],
    ).animate(controller);

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat();
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
        title: Text('Tween chaining'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.green,
            height: sizeAnimation.value,
            width: 350,
          ),
          Text('$sizeAnimation')
        ],
      ),
    );
  }
}
