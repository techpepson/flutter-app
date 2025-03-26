import 'package:flutter/material.dart';
import "loading.dart";
import 'user_input.dart';
import 'net_ninja.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.amber,
        )),
    initialRoute: '/home',
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => WeatherAppHome(),
      '/input': (context) => UserCounter()
    },
  ));
}
