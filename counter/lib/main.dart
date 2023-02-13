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
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(
                '$count',
                style: const TextStyle(fontSize: 30),
              ),
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
