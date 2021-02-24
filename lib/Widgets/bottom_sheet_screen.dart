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
                  getProportionateImageSize(5),
                ),
              ),
              height: getProportionateScreenHeight(52.96),
              width: getProportionateImageSize(56),
              child: Image.asset(
                'assets/person.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John’s Doe',
                  style: TextStyle(
                    color: Color(0xFF4C5264),
                    fontSize: getProportionateFontSize(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Row(
                  children: [
                    Text(
                      '4.5',
                      style: TextStyle(
                        color: Color(0xFF4C5264),
                        fontSize: getProportionateFontSize(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xFFFFB900),
                      size: getProportionateImageSize(12.6),
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
            borderRadius: BorderRadius.circular(5),
          ),
          height: getProportionateScreenHeight(40),
          width: getProportionateScreenWidth(40),
          child: Center(
            child: Icon(
              Icons.message,
              size: getProportionateImageSize(18),
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
        dismissible: false,
        buttonColor: Colors.black,
        backgroundColor: Color(0xFFE2E8ED),
        shimmer: false,
        action: () {
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
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        icon: Center(
          child: Image.asset(
            'assets/icons.png',
            height: getProportionateImageSize(24),
            width: getProportionateImageSize(24),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            getProportionateImageSize(10),
          ),
          topRight: Radius.circular(
            getProportionateImageSize(10),
          ),
        ),
        border: Border.all(
          color: Colors.grey[100],
        ),
      ),
      height: getProportionateScreenHeight(250),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(23),
          vertical: getProportionateScreenHeight(23),
        ),
        child: Column(
          children: [
            _bottomSheetUpperPart(),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            if (timer == false)
              Text(
                'Get your gear setup & ready to work.',
                style: TextStyle(
                  color: Color(0xFF4C5264),
                  fontSize: getProportionateFontSize(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (timer) NewStopWatch(startStop),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            _slider(),
          ],
        ),
      ),
    );
  }
}
