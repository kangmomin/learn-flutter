import 'package:flutter/material.dart';
import 'package:webtoon_nikko/screen/detail_screen.dart';
import 'package:webtoon_nikko/widgets/webtoon_image.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon(
      {Key? key, required this.title, required this.thumb, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DetailScreen(title: title, thumb: thumb, id: id),
        ),
      ),
      child: Column(
        children: [
          Hero(
            tag: id,
            child: WebtoonImage(thumb: thumb),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
