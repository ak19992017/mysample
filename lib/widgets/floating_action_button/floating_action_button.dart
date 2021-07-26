import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButton'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            // FloatingActionButton has a Hero widget wrapped around it.
            // Since each FAB is a Hero, defining two of them on the same page
            // is not allowed without explicitly changing the hero tag of one of them.
            FloatingActionButton.extended(
              onPressed: () {},
              icon: Icon(Icons.save),
              label: Text('Save'),
              heroTag: '1',
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              // The foregroundColor colors the child inside the FAB.
              foregroundColor: Colors.black,
              // The backgroundColor colors the background of the button.
              backgroundColor: Colors.white,
              // If the icon inside has a user defined color and a foregroundColor
              // at the same time, the icon color will override the foregroundColor.
              heroTag: '2',
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              mini: true,
              heroTag: '3',
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              shape: RoundedRectangleBorder(),
              heroTag: '4',
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              heroTag: '5',
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.pink, width: 4.0)),
              heroTag: '6',
            ),
          ],
        ),
      ),
    );
  }
}
