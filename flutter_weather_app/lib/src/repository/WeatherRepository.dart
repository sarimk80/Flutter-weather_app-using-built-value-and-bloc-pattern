import 'package:flutter/material.dart';
import 'package:flutter_weather_app/src/model/simpleWeather.dart';
import 'package:flutter_weather_app/src/repository/WeatherApi.dart';

class WeatherRepository {
  WeatherApi weatherApi;
  WeatherRepository({@required this.weatherApi}) : assert(weatherApi != null);

  Future<SimpleWeahter> weatherRepo() async {
    return await weatherApi.getApiData();
  }
}
