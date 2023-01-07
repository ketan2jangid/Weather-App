import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIcon {
  static IconData getIcon(int condition) {
    if (condition >= 200 && condition <= 300)
      return WeatherIcons.thunderstorm;
    else if (condition >= 300 && condition <= 400)
      return WeatherIcons.showers;
    else if (condition >= 500 && condition <= 600)
      return WeatherIcons.day_rain_wind;
    else if (condition >= 600 && condition <= 700)
      return WeatherIcons.snow;
    else if (condition >= 700 && condition <= 800)
      return WeatherIcons.day_haze;
    else
      return WeatherIcons.cloudy;
  }
}
