import 'package:flutter/material.dart';
import 'package:webtoon_nikko/models/webtoon_detail_model.dart';
import 'package:webtoon_nikko/models/webtoon_episode_model.dart';
import 'package:webtoon_nikko/service/api_service.dart';
import 'package:webtoon_nikko/widgets/episode_widget.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: WebtoonImage(thumb: widget.thumb),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, AsyncSnapshot<WebtoonDetailModel> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${snapshot.data!.genre}/${snapshot.data!.age}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    );
                  }
                  return const Text("...");
                },
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: epi,
                builder: (context,
                    AsyncSnapshot<List<WebtoonEpisodModel>> snapshot) {
                  if (!snapshot.hasData) return const Text("Loading...");
                  return Column(
                    children: [
                      for (var epi in snapshot.data!)
                        Episode(epi: epi, webtoonId: widget.id),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
