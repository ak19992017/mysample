import 'package:flutter/material.dart';

class MyTabDemo extends StatefulWidget {
  const MyTabDemo({Key? key}) : super(key: key);

  @override
  State<MyTabDemo> createState() => _MyTabDemoState();
}

class _MyTabDemoState extends State<MyTabDemo>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });

      print("Selected index" + _controller.index.toString());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                centerTitle: true,
                bottom: TabBar(
                  controller: _controller,
                  isScrollable: true,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueAccent,
                  ),
                  indicatorColor: Colors.redAccent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 5,
                  tabs: const [
                    Tab(text: 'Flight'),
                    Tab(text: 'Train'),
                    Tab(text: 'Car'),
                    Tab(text: 'Cycle'),
                    Tab(text: 'Boat'),
                  ],
                ),
                title: const Text('Tab demo'),
              ),
            ];
          },
          body: TabBarView(
            controller: _controller,
            children: const [
              Center(child: Icon(Icons.flight, size: 300)),
              Center(child: Icon(Icons.directions_transit, size: 300)),
              Center(child: Icon(Icons.directions_car, size: 300)),
              Center(child: Icon(Icons.directions_bike, size: 300)),
              Center(child: Icon(Icons.directions_boat, size: 300)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.animateTo((_selectedIndex += 1) % 5);
          },
          child: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }
}
