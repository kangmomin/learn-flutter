import 'package:flutter/material.dart';
import 'package:webtoon_nikko/models/webtoon_model.dart';
import 'package:webtoon_nikko/service/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebtoons() async {
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForWebtoons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Today's toons",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
    );
  }
}
