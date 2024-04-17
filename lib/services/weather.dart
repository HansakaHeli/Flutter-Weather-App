import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apikey = 'bcd4ad92c89f5d78c2b8dbb092e63bda';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherMapURL?q=$cityName&appid=$apikey&units=metric';
    // Create object of NetworkHelper class from network.dart file and pass url to constructor
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData(); // getData is a async method
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    // Crete an object of Location class of location.dart file
    Location location = Location();
    await location.getCurrentLocation();

    // Create an object from NetworkHelper class in networking.dart file and pass url to constructor
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    // Get returned deecodedData
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}