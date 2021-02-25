import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task1/helper/size_config.dart';

class NewStopWatch extends StatefulWidget {
  bool startStop;
  NewStopWatch(this.startStop);
  @override
  _NewStopWatchState createState() => _NewStopWatchState();
}

class _NewStopWatchState extends State<NewStopWatch> {
  Stopwatch watch = Stopwatch();
  Timer timer;
  //bool startStop = true;
  DateTime startTime, endTime;

  String elapsedTime = '00:00:00';

  updateTime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        print("startstop Inside=${widget.startStop}");
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'TIMER',
          style: TextStyle(
            fontSize: 3.44 * SizeConfig.textMultiplier,
            color: Color(0xFF4C5264),
          ),
        ),
        Text(
          elapsedTime,
          style: TextStyle(
            fontSize: 3.44 * SizeConfig.textMultiplier,
            color: Color(0xFFF98411),
          ),
        ),
        Container(
          height: 6 * SizeConfig.heightMultiplier,
          width: 10.83 * SizeConfig.widthMultiplier,
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              print(widget.startStop);
              if (widget.startStop)
                startWatch();
              else
                stopWatch();
            },
            child: Icon(
              widget.startStop ? Icons.play_arrow : Icons.stop,
            ),
          ),
        ),
      ],
    );
  }

  startWatch() async {
    setState(
      () {
        widget.startStop = false;
        watch.start();
        timer = Timer.periodic(
          Duration(milliseconds: 100),
          updateTime,
        );
      },
    );
  }

  stopWatch() {
    setState(() {
      widget.startStop = true;
      watch.stop();
      setTime();
    });
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}
