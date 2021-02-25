import 'package:flutter/material.dart';
import 'package:task1/Screens/home_screen_task2.dart';
import 'package:task1/Widgets/curve_painter.dart';
import '../helper/size_config.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xff181C1F),
        child: CustomPaint(
          painter: CurvePainter(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: (20), vertical: (20)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: (20)),
                    child: Image.asset(
                      'assets/close.png',
                      height: 3.125 * SizeConfig.heightMultiplier,
                      width: 5.56 * SizeConfig.widthMultiplier,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.625 * SizeConfig.heightMultiplier,
                ),
                Image.asset(
                  'assets/finger.png',
                  height: 31.25 * SizeConfig.heightMultiplier,
                  width: 37.27 * SizeConfig.widthMultiplier,
                ),
                SizedBox(
                  height: 3.90625 * SizeConfig.heightMultiplier,
                ),
                Text(
                  'YaYYY!',
                  style: TextStyle(
                    color: Color(0xFF075347),
                    fontSize: 5.3 * SizeConfig.textMultiplier,
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 18.75 * SizeConfig.heightMultiplier,
                ),
                Text(
                  'Success',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 3.43 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Rubik',
                  ),
                ),
                SizedBox(
                  height: 1.875 * SizeConfig.heightMultiplier,
                ),
                Text(
                  'We’re open in your area!',
                  style: TextStyle(
                    color: Color(0xFFE4E4E4),
                    fontSize: 2.34 * SizeConfig.textMultiplier,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 11.56 * SizeConfig.heightMultiplier,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreenTask2(),
                      ),
                    );
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xFFE4E4E4),
                      fontSize: 2.34 * SizeConfig.textMultiplier,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
