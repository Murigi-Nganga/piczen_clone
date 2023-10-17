import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:piczen_clone/weather/model/weather.dart';

class WeatherRepository {
  Future<Weather> getWeather(String city) async {
    final apiKey = dotenv.env['API_KEY'];
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey',
        ),
      );
      final responseBody = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 404) {
        throw Exception('City not found!');
      }

      return Weather.fromJson(responseBody['main'] as Map<String, dynamic>);
    } catch (error) {
      rethrow;
    }
  }
}
