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
              CountText(count: count),
              IconButton(
                onPressed: _addCount,
                icon: const Icon(Icons.add_box_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CountText extends StatelessWidget {
  const CountText({
    Key? key,
    required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count',
      style: TextStyle(
          fontSize: 30, color: Theme.of(context).textTheme.titleLarge!.color),
    );
  }
}
