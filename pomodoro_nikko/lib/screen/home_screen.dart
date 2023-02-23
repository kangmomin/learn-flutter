import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int duration = 1500;

  int totalSeconds = duration, successCount = 0;
  late Timer timer;
  bool isRun = false;

  void onTick(Timer timer) {
    setState(() {
      totalSeconds--;
      if (totalSeconds == -1) {
        isRun = false;
        timer.cancel();
        totalSeconds = duration;
        successCount++;
      }
    });
  }

  void onStartPressed() {
    setState(() {
      isRun = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  void onStopPressed() {
    setState(() {
      isRun = false;
    });
    timer.cancel();
  }

  String formatter(int second) {
    var duration = Duration(seconds: second);

    return duration.toString().split(".").first.substring(2, 7);
  }

  void reset() {
    onStopPressed();
    setState(() {
      totalSeconds = duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: reset,
                child: Text(
                  formatter(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                icon: isRun
                    ? const Icon(Icons.pause_circle_outlined)
                    : const Icon(Icons.play_circle_outline),
                onPressed: isRun ? onStopPressed : onStartPressed,
                iconSize: 120,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(50)),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          successCount.toString(),
                          style: TextStyle(
                            fontSize: 58,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
