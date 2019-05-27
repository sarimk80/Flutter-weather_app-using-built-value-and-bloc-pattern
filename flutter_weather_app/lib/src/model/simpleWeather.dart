import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'dart:convert' as json;

import 'package:flutter_weather_app/src/model/serializers.dart';

part 'simpleWeather.g.dart';

abstract class SimpleWeahter
    implements Built<SimpleWeahter, SimpleWeahterBuilder> {
  static Serializer<SimpleWeahter> get serializer => _$simpleWeahterSerializer;

  SimpleWeahter._();
  factory SimpleWeahter([void Function(SimpleWeahterBuilder) updates]) =
      _$SimpleWeahter;

  Coord get coord;
  /*": {
"lon": -0.13,
"lat": 51.51
},*/
  BuiltList<Weather> get weather;
  /*": [
{
"id": 300,
"main": "Drizzle",
"description": "light intensity drizzle",
"icon": "09d"
}
],*/
  String get base; //": "stations",
  Main get main;
  /*": {
"temp": 280.32,
"pressure": 1012,
"humidity": 81,
"temp_min": 279.15,
"temp_max": 281.15
},*/
  int get visibility; //": 10000,
  Wind get wind;
  /*": {
"speed": 4.1,
"deg": 80
},*/
  Clouds get clouds;
  /*": {
"all": 90
},*/
  int get dt; //": 1485789600,
  Sys get sys;
  /*": {
"type": 1,
"id": 5091,
"message": 0.0103,
"country": "GB",
"sunrise": 1485762037,
"sunset": 1485794875
},*/
  int get id; //": 2643743,
  String get name; //": "London",
  int get cod; //": 200
}

abstract class Coord implements Built<Coord, CoordBuilder> {
  static Serializer<Coord> get serializer => _$coordSerializer;
  Coord._();
  factory Coord([void Function(CoordBuilder) updates]) = _$Coord;

  double get lon; //": -0.13,
  double get lat; //": 51.51
}

abstract class Weather implements Built<Weather, WeatherBuilder> {
  static Serializer<Weather> get serializer => _$weatherSerializer;
  Weather._();
  factory Weather([void Function(WeatherBuilder) updates]) = _$Weather;

  int get id; //": 300,
  String get main; //": "Drizzle",
  String get description; //": "light intensity drizzle",
  String get icon; //": "09d"
}

abstract class Main implements Built<Main, MainBuilder> {
  static Serializer<Main> get serializer => _$mainSerializer;
  Main._();
  factory Main([void Function(MainBuilder) updates]) = _$Main;

  double get temp; //": 280.32,
  int get pressure; //": 1012,
  int get humidity; //": 81,
  double get temp_min; //": 279.15,
  double get temp_max; //": 281.15
}

abstract class Wind implements Built<Wind, WindBuilder> {
  static Serializer<Wind> get serializer => _$windSerializer;
  Wind._();
  factory Wind([void Function(WindBuilder) updates]) = _$Wind;

  double get speed; //": 4.1,
  int get deg; //": 80
}

abstract class Clouds implements Built<Clouds, CloudsBuilder> {
  static Serializer<Clouds> get serializer => _$cloudsSerializer;
  Clouds._();
  factory Clouds([void Function(CloudsBuilder) updates]) = _$Clouds;

  int get all; //": 90
}

abstract class Sys implements Built<Sys, SysBuilder> {
  static Serializer<Sys> get serializer => _$sysSerializer;
  Sys._();
  factory Sys([void Function(SysBuilder) updates]) = _$Sys;

  int get type; //": 1,
  int get id; //": 5091,
  double get message; //": 0.0103,
  String get country; //": "GB",
  int get sunrise; //": 1485762037,
  int get sunset; //": 1485794875
}

SimpleWeahter getData(String jsondata) {
  final res = json.jsonDecode(jsondata);
  SimpleWeahter simpleWeahter =
      standardSerializers.deserializeWith(SimpleWeahter.serializer, res);
  return simpleWeahter;
}
