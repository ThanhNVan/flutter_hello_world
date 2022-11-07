import 'package:flutter/material.dart';

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
            //Navigator.of(context).pop();
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            //Navigator.of(context).pop();
            Navigator.of(context, rootNavigator: true).pushNamed("/bmi");
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
