import 'package:flutter/material.dart';

class MyGradient extends StatefulWidget {
  const MyGradient({Key? key}) : super(key: key);

  @override
  _MyGradientState createState() => _MyGradientState();
}

class _MyGradientState extends State<MyGradient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Gradients"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.orange,
                Colors.yellow,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.blue, Colors.orange, Colors.pink],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.3, 0.7, 1],
          ),

          // gradient: RadialGradient(
          //   colors: [Colors.green, Colors.blue, Colors.orange, Colors.pink],
          //   stops: [0.2, 0.5, 0.7, 1],
          //   center: Alignment(0.1, 0.3),
          //   focal: Alignment(-0.1, 0.6),
          //   focalRadius: 2,
          // ),

          // gradient: SweepGradient(
          //   colors: [
          //     Colors.blue,
          //     Colors.green,
          //     Colors.yellow,
          //     Colors.red,
          //     Colors.blue
          //   ],
          //   stops: [0.0, 0.25, 0.5, 0.75, 1],
          //   startAngle: 0.5,
          //   endAngle: 2,
          // ),
        ),
        child: Center(
          child: Text(
            'Gradients are cool !',
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
