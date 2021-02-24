import 'package:flutter/material.dart';
import 'package:task1/Screens/home_screen_task2.dart';
import 'package:task1/Widgets/curve_painter.dart';
import 'package:task1/helper/size_config.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xff181C1F),
        child: CustomPaint(
          painter: CurvePainter(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(20)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: getProportionateScreenHeight(20)),
                    child: Image.asset(
                      'assets/close.png',
                      height: getProportionateImageSize(20),
                      width: getProportionateImageSize(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4),
                ),
                Image.asset(
                  'assets/finger.png',
                  height: getProportionateImageSize(200),
                  width: getProportionateImageSize(134.17),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Text(
                  'Yayyy!',
                  style: TextStyle(
                    color: Color(0xFF075347),
                    fontSize: getProportionateFontSize(36),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(120),
                ),
                Text(
                  'Success',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: getProportionateFontSize(24),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(12),
                ),
                Text(
                  'We’re open in your area!',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: getProportionateFontSize(17),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(74),
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
                      fontSize: getProportionateFontSize(17),
                      fontWeight: FontWeight.bold,
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
