import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/networking/locationInfo.dart';
import 'package:weather/screens/searchPage.dart';

import '../networking/weather.dart';
import '../utilities/appColors.dart';
import '../utilities/weatherIcon.dart';

const String APIKey = '5ac6fa502f43976e837ae1ed135e694a';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double lat = 0.0;
  double lon = 0.0;
  String city = "";
  int temp = 0;
  int maxTemp = 0;
  int minTemp = 0;
  int humidity = 0;
  int wind = 0;
  String visibility = "";
  String weatherDescription = "";
  IconData weatherIcon = Icons.sunny;
  dynamic weatherInfo;

  Weather weather = Weather();
  LocationInfo locationInfo = LocationInfo();

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    weatherInfo = await locationInfo.currentInfo();
    setState(() {
      updateInfo();
    });
  }

  void updateInfo() {
    city = weatherInfo['name'];

    weatherDescription = weatherInfo['weather'][0]['description'];

    double temperature = weatherInfo['main']['temp'];
    temp = temperature.toInt();
    double minTemperature = weatherInfo['main']['temp_min'];
    minTemp = minTemperature.toInt();
    double maxTemperature = weatherInfo['main']['temp_max'];
    maxTemp = maxTemperature.toInt();

    humidity = weatherInfo['main']['humidity'];

    dynamic windSpeed = weatherInfo['wind']['speed'];
    wind = windSpeed.toInt();

    double visible = weatherInfo['visibility'] / 1000;
    visibility = visible.toStringAsFixed(1);

    weatherIcon = WeatherIcon.getIcon(weatherInfo['weather'][0]['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  city,
                  style: GoogleFonts.italiana(
                    fontSize: 45,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                flex: 3,
                child: Icon(
                  weatherIcon,
                  size: 120.0,
                  color: MutedBlack,
                ),
              ),
              Text(
                '$temp°C',
                style: TextStyle(
                  color: MutedBlack,
                  fontSize: 75.0,
                ),
              ),
              Text(
                weatherDescription.toUpperCase(),
                style: TextStyle(
                  fontSize: 20.0,
                  color: MutedBlack,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Max Temp              $maxTemp°C'),
                      Text('Min Temp               $minTemp°C'),
                      Text('Humidity                 $humidity%'),
                      Text('Wind                     $wind m/s'),
                      Text('Visibility               $visibility km'),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () async {
                    var searchedCity = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SearchPage();
                      }),
                    );

                    if (searchedCity != null && searchedCity == 'myloc') {
                      getData();
                    } else if (searchedCity != null) {
                      weatherInfo =
                          await weather.getCityWeatherInfo(searchedCity);
                      setState(() {
                        updateInfo();
                      });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    height: 10.0,
                    width: 85.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      border: Border.all(
                        color: MutedBlack,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.search,
                      color: MutedBlack,
                      size: 45.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// BottomButton(
// buttonIcon: Icons.search,
// buttonAction: updateUI(),
// ),
