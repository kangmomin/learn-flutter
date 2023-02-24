import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_nikko/models/webtoon_model.dart';

class ApiService {
  static const String _basicUtl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String _today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoons = [];
    final url = Uri.parse('$_basicUtl/$_today');
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
