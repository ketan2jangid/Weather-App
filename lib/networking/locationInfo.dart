import 'package:geolocator/geolocator.dart' as geo;
import 'package:location/location.dart';

import 'weather.dart';

class LocationInfo {
  Future currentInfo() async {
    bool serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
    geo.LocationPermission permission;

    if (!serviceEnabled) {
      print('Location service disabled');

      Location location = Location();
      if (!(await location.serviceEnabled())) {
        if (!(await location.requestService())) {
          print('Location permission not granted');
        }
      }
    }

    permission = await geo.Geolocator.checkPermission();

    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        print('Location permission not granted');
      }
    }

    try {
      geo.Position position = await geo.Geolocator.getCurrentPosition(
          desiredAccuracy: geo.LocationAccuracy.low);

      print(position.latitude);
      print(position.longitude);

      return Weather()
          .getCurrLocWeatherInfo(position.latitude, position.longitude);
    } catch (e) {
      print('Unable to get user location');
    }
  }
}
