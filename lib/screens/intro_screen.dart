import 'package:flutter/material.dart';
import 'package:flutter_hello_world/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("hello world"),
      ),
      drawer: MenuDrawer(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: const AssetImage("images/wjbu.png"),
          fit: BoxFit.cover,
        )),
        child: Center(
            child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white70,
                ),
                child: const Text(
                  "hello world \nform the body",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        offset: Offset(1.1, 1.1),
                        blurRadius: 2.1,
                        color: Colors.green,
                      )
                    ],
                  ),
                ))),
      ),
      bottomNavigationBar: MenuBottom(),
    ));
  }
}

class MenuBottom extends StatelessWidget {
  const MenuBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            //Navigator.of(context).pop();
            Navigator.pushNamed(context, "/bmi");
            break;
          default:
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight), label: 'BMI')
      ],
    );
  }
}
