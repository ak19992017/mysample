import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyToDoUiAnimation extends StatefulWidget {
  const MyToDoUiAnimation({Key? key}) : super(key: key);

  @override
  _MyToDoUiAnimationState createState() => _MyToDoUiAnimationState();
}

class _MyToDoUiAnimationState extends State<MyToDoUiAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _profilePictureAnimation;
  late Animation _contentAnimation;
  late Animation _listAnimation;
  late Animation _fabAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

// iconSize goes from 0.0 to 50.0
    _profilePictureAnimation = Tween(begin: 0.0, end: 50.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.20, curve: Curves.easeOut)));

// fontSize goes from 0.0 to 34.0
    _contentAnimation = Tween(begin: 0.0, end: 34.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.20, 0.40, curve: Curves.easeOut)));

// Opacity goes from 0.0 to 1.0
    _listAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.40, 0.75, curve: Curves.easeOut)));

// Fab Size goes from size * 0.0 to size * 1.0
    _fabAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.75, 1.0, curve: Curves.easeOut)));

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.supervised_user_circle),
            color: Colors.black,
            onPressed: () {},
            iconSize: _profilePictureAnimation.value,
          ),
        ],
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 16.0,
          ),
          Text(
            "Good Morning",
            style: TextStyle(
                fontSize: _contentAnimation.value, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "Here are your plans for today",
            style: TextStyle(fontSize: 18.0),
          ),
          Expanded(
            child: Opacity(
              opacity: _listAnimation.value,
              child: ListView.builder(
                itemBuilder: (context, position) {
                  return CheckboxListTile(
                    title: Text("This is item $position"),
                    value: true,
                    onChanged: (val) {},
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Transform.scale(
        scale: _fabAnimation.value,
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
