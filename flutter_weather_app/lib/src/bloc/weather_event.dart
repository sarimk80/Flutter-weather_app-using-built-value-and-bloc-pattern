import 'package:meta/meta.dart';

@immutable
abstract class WeatherEvent {}

class Fetch extends WeatherEvent {}
