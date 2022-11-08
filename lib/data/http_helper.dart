import 'package:flutter_hello_world/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?q=London&appid=37512f5698244528d5168e4d537209ac

  final String authority = "api.openweathermap.org";
  final String path = "data/2.5/weather";
  final String apiKey = '37512f5698244528d5168e4d537209ac';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);

    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
