import 'dart:convert';

import 'package:http/http.dart' as http;

const String openWeatherLink =
    'https://api.openweathermap.org/data/2.5/weather';
const String APIKey = '5ac6fa502f43976e837ae1ed135e694a';

class Weather {
  Future getCurrLocWeatherInfo(double lat, double lon) async {
    String urlLink =
        '$openWeatherLink?lat=$lat&lon=$lon&appid=$APIKey&units=metric';
    Uri url = Uri.parse(urlLink);

    print('got http response');
    http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      print('Unable to fetch weather info');
      print(response.statusCode);
    }

    print(response.statusCode);
    return jsonDecode(response.body);
  }

  Future getCityWeatherInfo(String city) async {
    String urlLink = '$openWeatherLink?q=$city&appid=$APIKey&units=metric';
    Uri url = Uri.parse(urlLink);

    print('got http response');
    http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      print('Unable to fetch weather info');
      print(response.statusCode);
    }

    print(response.statusCode);
    return jsonDecode(response.body);
  }
}
