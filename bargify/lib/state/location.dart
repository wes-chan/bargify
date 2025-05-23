import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService{

Future<String?> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled){
    return "Location services are disabled.";

  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied){
    permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied){
        return "Location permission are denied.";
      }

  }
  if (permission == LocationPermission.deniedForever){
    return "Location permissions are permanently denied, we cannot request permissions.";
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