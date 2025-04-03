import 'package:app/widgets/googlemap.dart' show googlemapwidget;
import 'package:flutter/material.dart';

void main() {
  runApp(const customgooglemap());
}

class customgooglemap extends StatelessWidget {
  const customgooglemap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: googlemapwidget()),
    );
  }
}
