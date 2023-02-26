import 'package:flutter/material.dart';
import 'package:webtoon_nikko/models/webtoon_detail_model.dart';
import 'package:webtoon_nikko/models/webtoon_episode_model.dart';
import 'package:webtoon_nikko/service/api_service.dart';
import 'package:webtoon_nikko/widgets/webtoon_image.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen(
      {Key? key, required this.title, required this.thumb, required this.id})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodModel>> epi;

  @override
  void initState() {
    super.initState();
    epi = ApiService.getLastEpisodesById(widget.id);
    webtoon = ApiService.getDetailWebtoon(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.id,
                child: WebtoonImage(thumb: widget.thumb),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
