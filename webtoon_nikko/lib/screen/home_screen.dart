import 'package:flutter/material.dart';
import 'package:webtoon_nikko/models/webtoon_model.dart';
import 'package:webtoon_nikko/service/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text("There is Data");
          }

          return const Text("Loading...");
        },
      ),
    );
  }
}
