import 'package:flutter/material.dart';
import 'package:task1/Widgets/bottom_bar.dart';
import 'package:task1/Widgets/bottom_sheet_screen.dart';
import 'package:task1/Widgets/home_detail_screen.dart';
import 'package:task1/Widgets/top_widget.dart';

class HomeScreenTask2 extends StatefulWidget {
  @override
  _HomeScreenTask2State createState() => _HomeScreenTask2State();
}

class _HomeScreenTask2State extends State<HomeScreenTask2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomSheetScreen(),
      bottomNavigationBar: BottomBarWidget(),
      body: ListView(
        children: [
          TopWidget(),
          HomeDetailScreen(),
        ],
      ),
    );
  }
}
