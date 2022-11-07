import 'package:flutter/material.dart';
import 'package:flutter_hello_world/shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
        ),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
