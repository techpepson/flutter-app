import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('My Awesome App')),
            body: Center(child: Builder(
              builder: (context) {
                return Column(
                  children: [
                    const Text('Hello World!'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          print("You will get there!");
                        },
                        child: const Text('A button')),
                  ],
                );
              },
            ))));
  }
}
