import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:task1/helper/size_config.dart';

class BottomBarWidget extends StatefulWidget {
  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      height: 10.93 * SizeConfig.heightMultiplier,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (24),
          vertical: (24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _image('assets/calendar.png', 0),
            VerticalDivider(
              color: Color(0xB3BCC5D3),
            ),
            _image('assets/project.png', 1),
            VerticalDivider(
              color: Color(0xB3BCC5D3),
            ),
            _image('assets/calendar.png', 2),
            VerticalDivider(
              color: Color(0xB3BCC5D3),
            ),
            _image('assets/path.png', 0),
            VerticalDivider(
              color: Color(0xB3BCC5D3),
            ),
            _image('assets/more.png', 0),
          ],
        ),
      ),
    );
  }

  Widget _image(
    String imagePath,
    int count,
  ) {
    return count > 0
        ? Badge(
            badgeColor: Color(0xFFF9C311),
            badgeContent: Text(
              '3',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
            ),
            child: Image.asset(
              imagePath,
              height: 3.75 * SizeConfig.heightMultiplier,
              width: 6.67 * SizeConfig.widthMultiplier,
            ),
          )
        : Image.asset(
            imagePath,
            height: 3.75 * SizeConfig.heightMultiplier,
            width: 6.67 * SizeConfig.widthMultiplier,
          );
  }
}
