import 'package:flutter/material.dart';

class UserCounter extends StatefulWidget {
  const UserCounter({super.key});

  @override
  State<UserCounter> createState() => _Counter();
}

class _Counter extends State<UserCounter> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("I am a column counter with count $count"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: increment,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
