import 'package:flutter_weather_app/src/model/simpleWeather.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherState {}

class InitialWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  final SimpleWeahter simpleWeahter;
  LoadedWeatherState({this.simpleWeahter}) : assert(simpleWeahter != null);
}
class ErrorState extends WeatherState{}
