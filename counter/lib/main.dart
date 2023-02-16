import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  bool showTitle = true;

  void _toggleTitle() {
    showTitle = !showTitle;
  }

  void _addCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              showTitle ? CountText(count: count) : const Text("nothing"),
              IconButton(
                onPressed: _addCount,
                icon: const Icon(Icons.add_box_outlined),
              ),
              IconButton(
                onPressed: _toggleTitle,
                icon: showTitle
                    ? const Icon(Icons.toggle_off)
                    : const Icon(Icons.toggle_on),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CountText extends StatefulWidget {
  const CountText({
    Key? key,
    required this.count,
  }) : super(key: key);

  final int count;

  @override
  State<CountText> createState() => _CountTextState();
}

class _CountTextState extends State<CountText> {
  // 위젯이 나타나기 전에 한번 실행
  @override
  void initState() {
    super.initState();
  }

  // 위젯이 사라질 때 실행
  @override
  void dispose() {
    super.dispose();
  }

  // 위젯에서 UI를 만드는 함수
  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.count}',
      style: TextStyle(
          fontSize: 30, color: Theme.of(context).textTheme.titleLarge!.color),
    );
  }
}
