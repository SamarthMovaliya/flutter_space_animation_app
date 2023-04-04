import 'package:flutter/material.dart';
import 'package:galaxy_animation_app/screens/DetailPage.dart';
import 'package:galaxy_animation_app/screens/watch.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => HomePage(),
      'DetailPage': (context) => DetailPage(),
    },
  ));
}
