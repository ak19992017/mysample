import 'package:flutter/material.dart';

class MyImplictAnimatedWidget extends StatefulWidget {
  const MyImplictAnimatedWidget({Key? key}) : super(key: key);

  @override
  _MyImplictAnimatedWidgetState createState() =>
      _MyImplictAnimatedWidgetState();
}

class _MyImplictAnimatedWidgetState extends State<MyImplictAnimatedWidget> {
  var color = Colors.blue;
  var height = 100.0;
  var width = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implict Animated Widget'),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              color: color,
              height: height,
              width: width,
            ),
            ElevatedButton(
              onPressed: () {
                if (color == Colors.green) {
                  setState(() {
                    color = Colors.blue;
                    height = 100.0;
                    width = 100.0;
                  });
                } else {
                  setState(() {
                    color = Colors.green;
                    height = MediaQuery.of(context).size.height;
                    width = MediaQuery.of(context).size.width;
                  });
                }
              },
              child: Text(
                "Animate!",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
