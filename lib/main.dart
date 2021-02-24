import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/Provider/post_provider.dart';
import 'package:task1/Screens/home_screen.dart';

import 'helper/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: PostProvider(),
        ),
        //ChangeNotifierProvider.value(value: ImageProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
