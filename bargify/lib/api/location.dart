import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Location{

Future<String?> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled){
    return "";

  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied){
    permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied){
        return "";
      }

  }
  if (permission == LocationPermission.deniedForever){
    return "";
  }

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high
  );

  Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);

  List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

  if (placemarks.isNotEmpty){
    final place = placemarks.first;
    return '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}';

  } else {
    return "";
  }
  

}
}