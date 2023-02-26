import 'package:flutter/material.dart';
import 'package:webtoon_nikko/widgets/webtoon_image.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen(
      {Key? key, required this.title, required this.thumb, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
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
                tag: id,
                child: WebtoonImage(thumb: thumb),
              ),
              FutureBuilder(builder: () => ))
            ],
          ),
        ],
      ),
    );
  }
}
