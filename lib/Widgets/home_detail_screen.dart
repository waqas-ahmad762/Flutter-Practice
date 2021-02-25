import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task1/Models/post.dart';
import 'package:task1/Provider/post_provider.dart';
import 'package:task1/helper/size_config.dart';

class HomeDetailScreen extends StatefulWidget {
  @override
  _HomeDetailScreenState createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  bool _isLoading = true, _isInit = true;

  List<Post> _post;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _post = [];
      _getData();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _getPost() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final postProvider = Provider.of<PostProvider>(
        context,
        listen: false,
      );
      await postProvider.fetchPostList();
      _post = postProvider.postList;
      print(_post);
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print(error);
    }
  }

  Future<void> _getData() async {
    await _getPost();
  }

  var now = new DateTime.now();
  var date = new DateFormat.yMMMMd('en_US').format(DateTime.now());
  var time = new DateFormat.jm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Padding(
            padding: EdgeInsets.only(
              top: (20),
            ),
            child: Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                  Color(0xFF43A236),
                ),
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (23),
              vertical: (23),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _post[0].name.substring(10), //'Lawn Mowing',
                  style: TextStyle(
                    color: Color(0xFF43A236),
                    fontSize: 3.43 * SizeConfig.textMultiplier,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 1.25 * SizeConfig.heightMultiplier,
                ),
                Text(
                  _post[0].email, //'Small Grass - 3 hours',
                  style: TextStyle(
                    color: Color(0xFF4C5264),
                    fontSize: 2.5 * SizeConfig.textMultiplier,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 3.125 * SizeConfig.heightMultiplier,
                ),
                _heading(
                  'assets/ico.png',
                  'Today $date $time',
                  Color(0xFF43A236),
                ),
                SizedBox(
                  height: 1.25 * SizeConfig.heightMultiplier,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 33),
                  child: Text(
                    'Recurring, Every 2 weeks',
                    style: TextStyle(
                      color: Color(0xFF4C5264),
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.125 * SizeConfig.heightMultiplier,
                ),
                _heading('assets/path2.png', '221B barket Sector',
                    Color(0xFF43A236)),
                Padding(
                  padding: EdgeInsets.only(left: 33),
                  child: Text(
                    'Sector 2B, Phase2, New York USA',
                    style: TextStyle(
                      color: Color(0xFF4C5264),
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.125 * SizeConfig.heightMultiplier,
                ),
                _heading('assets/setting.png', '221B barket Sector',
                    Color(0xFF43A236)),
                Padding(
                  padding: EdgeInsets.only(left: 33),
                  child: Text(
                    _post[0].body,
                    style: TextStyle(
                      color: Color(0xFF4C5264),
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.68 * SizeConfig.heightMultiplier,
                ),
              ],
            ),
          );
  }

  Widget _heading(
    String imagePath,
    String data,
    Color color,
  ) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          height: 2.36 * SizeConfig.heightMultiplier,
          width: 4.19 * SizeConfig.widthMultiplier,
          color: color,
        ),
        SizedBox(
          width: 5 * SizeConfig.widthMultiplier,
        ),
        Text(
          data,
          style: TextStyle(
            color: Color(0xFF4C5264),
            fontSize: 2.5 * SizeConfig.textMultiplier,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
