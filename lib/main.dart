import 'package:flutter/material.dart';
import 'package:mysample/widgets/basic_animation/basic_animation.dart';
import 'package:mysample/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:mysample/widgets/calender/calender.dart';
import 'package:mysample/widgets/drawer/drawer.dart';
import 'package:mysample/widgets/floating_action_button/floating_action_button.dart';
import 'package:mysample/widgets/gradient/gradient.dart';
import 'package:mysample/widgets/implict_animation_widget/implict_animation_widget.dart';
import 'package:mysample/widgets/navigation_rail/navigation_rail.dart';
import 'package:mysample/widgets/show_hide_on_scroll/show_hide_on_scroll.dart';
import 'package:mysample/widgets/staggered_animation/staggered_animation.dart';
import 'package:mysample/widgets/staggered_menu_animation/staggered_menu_animation.dart';
import 'package:mysample/widgets/stopwatch/stopwatch.dart';
import 'package:mysample/widgets/todo/todo.dart';

import 'package:mysample/widgets/todo_ui_animation/todo_ui_animation.dart';
import 'package:mysample/widgets/transform/transform.dart';
import 'package:mysample/widgets/tween_chaining/tween_chaining.dart';

import 'widgets/card_widget/card_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Sample'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ButtonAndWidget(
                  title: 'Bottam Naviagtion bar',
                  widget: MyBottomNavigationBar()),
              ButtonAndWidget(
                  title: 'Naviagtion Rail', widget: MyNavigationRail()),
              ButtonAndWidget(title: 'Drawer', widget: MyDrawer()),
              ButtonAndWidget(title: 'Gradient', widget: MyGradient()),
              ButtonAndWidget(title: '🔥StopWatch🔥', widget: MyStopWatch()),
              ButtonAndWidget(title: 'FAB', widget: MyFloatingActionButton()),
              ButtonAndWidget(
                  title: '1.Basic Animation', widget: MyBasicAnimation()),
              ButtonAndWidget(
                  title: '2.Implict Animation Widget',
                  widget: MyImplictAnimatedWidget()),
              ButtonAndWidget(
                  title: '3.Staggered Animation',
                  widget: MyStaggeredAnimation()),
              ButtonAndWidget(
                  title: '4.Tween chaining', widget: MyTweenChaining()),
              ButtonAndWidget(
                  title: '5.Transform ( translate,scale & rotate )',
                  widget: MyTransform()),
              ButtonAndWidget(
                  title: '🔥Real World Example🔥', widget: MyToDoUiAnimation()),
              ButtonAndWidget(
                  title: 'Staggered menu animation',
                  widget: MyStaggeredMenuAnimation()),
              ButtonAndWidget(title: '🔥 Todo app 🔥', widget: MyToDo()),
              ButtonAndWidget(title: 'Card widget', widget: MyCardWidget()),
              ButtonAndWidget(
                  title: 'Show/Hide on Scroll', widget: ShowHideOnScroll()),
              ButtonAndWidget(
                  title: 'Date Time DateTime DateTimerange Picker',
                  widget: MyCalender()),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonAndWidget extends StatelessWidget {
  final String title;
  final Widget widget;
  const ButtonAndWidget({
    Key? key,
    required this.title,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contect) => widget,
            ),
          );
        },
        child: Text(title),
      ),
    );
  }
}
