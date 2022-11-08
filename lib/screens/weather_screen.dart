import 'package:flutter/material.dart';
import 'package:flutter_hello_world/data/weather.dart';
import '../data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather('', "", 0, 0, 0, 0);
  final TextEditingController txtPlace = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                  hintText: 'Enter a city name',
                  suffixIcon: IconButton(
                    onPressed: getData,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            weatherRow('Place: ', result.name),
            weatherRow('Description: ', result.description),
            weatherRow('Temperature: ', result.temperature.toStringAsFixed(2)),
            weatherRow('Perceived: ', result.preceived.toStringAsFixed(2)),
            weatherRow('Pressure: ', result.pressure.toStringAsFixed(2)),
            weatherRow('Humidity: ', result.humidity.toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

  Widget weatherRow(String lable, String value) {
    Widget row = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              lable,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    );
    return row;
  }
}
