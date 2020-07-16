import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey;
const String openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/onecall';

class WeatherModel {
  static double latitude;
  static double longitude;

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getWeather();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    print("lat = ${location.latitude}");
    latitude = location.latitude;
    print("long = ${location.longitude}");
    longitude = location.longitude;

    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=$latitude&lon=$longitude&exclude=hourly,daily&appid=$apiKey&&units=metric');
    var weatherData = await networkHelper.getWeather();

    return weatherData;
  }

  String getWeatherIcon(int weatherId) {
    if (weatherId < 300) {
      return '🌩';
    } else if (weatherId < 400) {
      return '🌧';
    } else if (weatherId < 600) {
      return '☔️';
    } else if (weatherId < 700) {
      return '☃️';
    } else if (weatherId < 800) {
      return '🌫';
    } else if (weatherId == 800) {
      return '☀️';
    } else if (weatherId <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temperature) {
    if (temperature > 25) {
      return 'It\'s 🍦 time';
    } else if (temperature > 20) {
      return 'Time for shorts and 👕';
    } else if (temperature < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
