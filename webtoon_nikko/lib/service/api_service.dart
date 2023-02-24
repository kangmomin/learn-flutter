import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_nikko/models/webtoon_model.dart';

class ApiService {
  final String basicUtl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoons = [];
    final url = Uri.parse('$basicUtl/$today');
    var res = await http.get(url);

    if (res.statusCode == 200) {
      final List<dynamic> webtoonsData = jsonDecode(res.body);
      for (var e in webtoonsData) {
        webtoons.add(WebtoonModel.fromJson(e));
      }
      return webtoons;
    }

    throw Error();
  }
}
