import 'package:flutter/material.dart';

class MyTweenChaining extends StatefulWidget {
  const MyTweenChaining({Key? key}) : super(key: key);

  @override
  _MyTweenChainingState createState() => _MyTweenChainingState();
}

class _MyTweenChainingState extends State<MyTweenChaining> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween chaining'),
        centerTitle: true,
      ),
    );
  }
}
