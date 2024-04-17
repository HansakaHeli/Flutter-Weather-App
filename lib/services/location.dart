import 'package:geolocator/geolocator.dart';

class Location{

  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async{

    try{
      // Add location permission
      LocationPermission permission = await Geolocator.requestPermission();

      // Return the object from getCurrentPosition static method in geolocator.dart
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch(e){
      print(e);
    }
  }

}

