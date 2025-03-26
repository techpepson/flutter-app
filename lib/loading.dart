import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  Map<String, dynamic>? data; // Store API response

  void getData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      print("Failed to load data");
    }

    DateTime now = DateTime.parse("2025-01-20");
    print(now.day);
  }

  @override
  void initState() {
    super.initState();
    getData(); // Automatically call API on screen load
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("JSON Placeholder Example"),
        ),
        body: Center(
          child: data == null
              ? CircularProgressIndicator() // Show loading indicator
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ID: ${data!['id']}"),
                    Text("Title: ${data!['title']}"),
                    Text("Completed: ${data!['completed']}"),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: getData, // Call API on button press
                      child: Text("Refresh the Data"),
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          title: Text("I am the title"),
                        ));
                      },
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
