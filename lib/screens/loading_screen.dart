import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();

    getLocationData();
    // Run getLocation method as soon as loading screen widget get initialized
  }

  void getLocationData() async{

    // Create an object of WeatherModel Class in weather.dart
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    // Go to LocationScreen
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData);
    }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave( // Add Spinner
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}