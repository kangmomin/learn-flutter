import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_nikko/models/webtoon_detail_model.dart';
import 'package:webtoon_nikko/models/webtoon_episode_model.dart';
import 'package:webtoon_nikko/models/webtoon_model.dart';

class ApiService {
  static const String _basicUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String _today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoons = [];
    final url = Uri.parse('$_basicUrl/$_today');
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

  static Future<WebtoonDetailModel> getDetailWebtoon(String id) async {
    final url = Uri.parse('$_basicUrl/$id');
    var res = await http.get(url);

    if (res.statusCode != 200) throw Error();

    var webtoon = jsonDecode(res.body);
    return WebtoonDetailModel.fromJson(webtoon);
  }

  static Future<List<WebtoonEpisodModel>> getLastEpisodesById(String id) async {
    List<WebtoonEpisodModel> episodes = [];

    final url = Uri.parse('$_basicUrl/$id/episodes');
    var res = await http.get(url);

    if (res.statusCode != 200) throw Error();

    final epi = jsonDecode(res.body);

    for (var e in epi) {
      episodes.add(WebtoonEpisodModel.fromJson(e));
    }

    return episodes;
  }
}
