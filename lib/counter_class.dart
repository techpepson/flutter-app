import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyState(
      data: "Hello State!",
      child: MaterialApp(
        home: Counter(),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _MyCounterState();
}

class _MyCounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Count $count",
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: Text(
                MyState.of(context).data,
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyState extends InheritedWidget {
  MyState({super.key, required super.child, required this.data});

  final String data;

  static MyState of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<MyState>();
    assert(result != null, "No state found for this");
    return result!;
  }

  @override
  bool updateShouldNotify(MyState oldWidget) => data != oldWidget.data;
}
