import 'package:flutter/material.dart';
import 'package:webtoon_nikko/screen/home_screen.dart';
import 'package:webtoon_nikko/service/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
