import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'package:task1/Widgets/timer.dart';
import 'package:task1/helper/size_config.dart';

class BottomSheetScreen extends StatefulWidget {
  @override
  _BottomSheetScreenState createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  bool timer = false, startStop = true;
  Widget _bottomSheetUpperPart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
              height: 8.275 * SizeConfig.heightMultiplier,
              width: 18.05 * SizeConfig.widthMultiplier,
              child: Image.asset(
                'assets/person.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 3.89 * SizeConfig.widthMultiplier,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John’s Doe',
                  style: TextStyle(
                    color: Color(0xFF4C5264),
                    fontSize: 2.5 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(
                  height: 2.34 * SizeConfig.heightMultiplier,
                ),
                Row(
                  children: [
                    Text(
                      '4.5',
                      style: TextStyle(
                        color: Color(0xFF4C5264),
                        fontSize: 2.18 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xFFFFB900),
                      size: (12.6),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 6.25 * SizeConfig.heightMultiplier,
          width: 11.11 * SizeConfig.widthMultiplier,
          child: Center(
            child: Icon(
              Icons.message,
              size: (18),
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ],
    );
  }

  Widget _slider() {
    return Center(
      child: SliderButton(
        buttonSize: 12.46 * SizeConfig.imageSizeMultiplier,
        height: 8.125 * SizeConfig.heightMultiplier,
        width: double.infinity,
        dismissible: false,
        buttonColor: Colors.black,
        backgroundColor: Color(0xFFE2E8ED),
        shimmer: false,
        action: () {
          print('action');
          print(timer);
          if (timer == false) {
            setState(() {
              timer = true;
            });
          } else {
            setState(() {
              //timer = false;
              startStop = false;
              print(startStop);
            });
            showDialog(
              context: context,
              child: new AlertDialog(
                title: new Text("Break"),
                content: new Text("Enjoy Cup of Cffee"),
              ),
            );
          }
        },
        label: Text(
          timer == false ? "SLIDE TO START WORK" : "SLIDE TO END WORK",
          style: TextStyle(
            color: Color(0xFF2E2E2E),
            fontSize: 2.18 * SizeConfig.textMultiplier,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
          ),
          textAlign: TextAlign.center,
        ),
        icon: Center(
          child: Image.asset(
            'assets/icons.png',
            height: 3.75 * SizeConfig.heightMultiplier,
            width: 6.67 * SizeConfig.widthMultiplier,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            10,
          ),
          topRight: Radius.circular(
            10,
          ),
        ),
        border: Border.all(
          color: Colors.grey[100],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF4C52641A),
            blurRadius: 5,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0),
          )
        ],
      ),
      height: 41.3125 * SizeConfig.heightMultiplier,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (23),
          vertical: (23),
        ),
        child: Column(
          children: [
            _bottomSheetUpperPart(),
            SizedBox(
              height: 2.34 * SizeConfig.heightMultiplier,
            ),
            Divider(),
            SizedBox(
              height: 2.34 * SizeConfig.heightMultiplier,
            ),
            if (timer == false)
              Text(
                'Get your gear setup & ready to work.',
                style: TextStyle(
                  color: Color(0xFF4C5264),
                  fontSize: 2.5 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                ),
              ),
            if (timer) NewStopWatch(startStop),
            SizedBox(
              height: 1.56 * SizeConfig.heightMultiplier,
            ),
            SizedBox(
              height: 2.34 * SizeConfig.heightMultiplier,
            ),
            _slider(),
          ],
        ),
      ),
    );
  }
}
