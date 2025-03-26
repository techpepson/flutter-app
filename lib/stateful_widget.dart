import 'package:flutter/material.dart';

void main() => runApp(AppHome());

class AppHome extends StatelessWidget {
  AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: MyWidget(),
      ),
    );
  }
}

class CounterInit extends StatefulWidget {
  CounterInit({super.key});

  @override
  State<CounterInit> createState() => _CounterApp();
}

class _CounterApp extends State<CounterInit> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
