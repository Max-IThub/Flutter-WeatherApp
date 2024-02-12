import 'dart:convert';

import 'package:http/http.dart' as http;

class Weather{
  Future<WeatherResponse> getWeather() async {
   const String api_key = '839378a7134c4846967102157241202';
   String city = 'moscow';

    Uri uri = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=$api_key &q=$city&aqi=no',
    );
  
    final res = await http.get(uri);
    return WeatherResponse.fromJson(jsonDecode(res.body));
  }
}

class WeatherResponse{
  WeatherResponse({
    required this.current,
  });
  CurrentWeather current;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => WeatherResponse(
    current: CurrentWeather.fromJson(json['current']),
  );

}

class CurrentWeather{
  CurrentWeather({
    required this.degree,
    required this.degreeFeelsLike,
  });

  double degree;
  double degreeFeelsLike;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
    degree: json['temp_c'], 
    degreeFeelsLike: json['feelslike_c'],
    );

  
}