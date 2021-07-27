import 'package:flutter/material.dart';

class MyToDo extends StatefulWidget {
  const MyToDo({Key? key}) : super(key: key);

  @override
  _MyToDoState createState() => _MyToDoState();
}

class _MyToDoState extends State<MyToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.supervised_user_circle),
            color: Colors.black,
            onPressed: () {},
            iconSize: 50.0,
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
            style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "Here are your plans for today",
            style: TextStyle(fontSize: 18.0),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, position) {
                return CheckboxListTile(
                  title: Text("This is item $position"),
                  value: true,
                  onChanged: (val) {},
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
