import 'package:flutter/material.dart';
import 'simple_cal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
            theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleCalculator(),
      
    );
  }
}
