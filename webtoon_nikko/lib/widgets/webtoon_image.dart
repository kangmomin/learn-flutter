import 'package:flutter/material.dart';

class WebtoonImage extends StatelessWidget {
  const WebtoonImage({
    Key? key,
    required this.thumb,
  }) : super(key: key);

  final String thumb;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: const Offset(0, 0),
            color: Colors.black.withOpacity(0.5),
          )
        ],
      ),
      child: Image.network(thumb),
    );
  }
}
