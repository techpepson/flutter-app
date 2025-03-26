import 'package:flutter/material.dart';

void main() => runApp(MyNewApp());

class MyNewApp extends StatelessWidget {
  MyNewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Forx App'),
        ),
        body: HoriVerticalLayouts(),
      ),
    );
  }
}

class PaddedText extends StatelessWidget {
  PaddedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Text("Hello Yaw!!!!!!!!!!!!!"),
    );
  }
}

class LayoutWidgets extends StatelessWidget {
  LayoutWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.all(16.0),
      child: Text('I am here now'),
    ));
  }
}

class HoriVerticalLayouts extends StatelessWidget {
  HoriVerticalLayouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("I am at the top and I will have money like crazy."),
            Text("I am at the bottom")
          ],
        ),
        Column(
          children: [Text("I am mee"), Text("I am meeee!")],
        )
      ],
    );
  }
}

class ListViewItems extends StatelessWidget {
  ListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, idx) {
        var item = idx;
        return Padding(
          padding: const EdgeInsets.all(8.5),
          child: Row(
            children: [Text("Item defined")],
          ),
        );
      },
    );
  }
}

class LayoutBuilderExample extends StatelessWidget {
  LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return Text("I am less than it");
        } else {
          return Text("I am more than it");
        }
      },
    );
  }
}
