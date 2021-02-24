import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:task1/helper/size_config.dart';

class TopWidget extends StatefulWidget {
  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  final List<String> imageUrl = [
    'https://wowslider.com/sliders/demo-93/data1/images/sunset.jpg',
    'https://www.bootstrapdash.com/bootstrap-4-tutorial/images/sunset.jpeg',
    'https://wowslider.com/sliders/demo-45/data1/images/boat.jpg',
    'https://demo.theme4press.com/evolve/files/layerslider/Simple-Slider/layerslider-3.jpeg'
  ];

  Widget _carousel() {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(200),
      color: Color(0XFFFFB900),
      child: CarouselSlider.builder(
        enableAutoSlider: true,
        unlimitedMode: true,
        slideBuilder: (index) {
          return Container(
            width: double.infinity,
            child: Image.network(
              imageUrl[index],
              fit: BoxFit.cover,
            ),
          );
        },
        slideIndicator: CircularSlideIndicator(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenHeight(10),
          ),
          currentIndicatorColor: Color(0xFFFFFFFF),
          indicatorBackgroundColor: Color(0xFFBCC5D3),
        ),
        itemCount: imageUrl.length,
      ),
    );
  }

  Widget _upperIcon() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(23),
        vertical: getProportionateScreenHeight(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(
              'assets/light-close.png',
              height: getProportionateImageSize(24),
              width: getProportionateImageSize(24),
            ),
          ),
          Image.asset(
            'assets/setting.png',
            height: getProportionateImageSize(24),
            width: getProportionateImageSize(24),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _carousel(),
        _upperIcon(),
      ],
    );
  }
}
