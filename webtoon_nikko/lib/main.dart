import 'package:flutter/material.dart';
import 'package:webtoon_nikko/screen/HomeScreen.dart';
import 'package:webtoon_nikko/service/ApiService.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
