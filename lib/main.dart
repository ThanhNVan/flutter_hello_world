import 'package:flutter/material.dart';
import 'package:flutter_hello_world/screens/bmi_screen.dart';
import 'package:flutter_hello_world/screens/intro_screen.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi': (context) => BmiScreen()
      },
      initialRoute: "/",
    );
  }
}
