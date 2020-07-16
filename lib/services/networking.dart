import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getWeather() async {
    try {
      http.Response response = await http.get(
        url
      );
      String weatherData;
      response.statusCode == 200 ? weatherData = response.body : print(response.statusCode);

      return jsonDecode(weatherData);
    } catch (e) {
      print( "Failed get location data");
      print(e);
    }
  }
}