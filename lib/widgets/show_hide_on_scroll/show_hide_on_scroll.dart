import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShowHideOnScroll extends StatefulWidget {
  const ShowHideOnScroll({Key? key}) : super(key: key);

  @override
  State<ShowHideOnScroll> createState() => _ShowHideOnScrollState();
}

class _ShowHideOnScrollState extends State<ShowHideOnScroll> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            title: Text("Demo app"),
            centerTitle: true,
          )
        ],
        body: Center(
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.forward) {
                if (!isVisible) setState(() => isVisible = true);
              } else if (notification.direction == ScrollDirection.reverse) {
                if (isVisible) setState(() => isVisible = false);
              }
              return true;
            },
            child: ListView.separated(
              separatorBuilder: (context, count) => Divider(),
              itemCount: 30,
              itemBuilder: (context, count) => ListTile(
                title: Text("List Item " + count.toString()),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: isVisible
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
