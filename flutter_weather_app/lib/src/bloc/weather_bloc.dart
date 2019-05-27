import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app/src/model/simpleWeather.dart';
import 'package:flutter_weather_app/src/repository/WeatherRepository.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);
  @override
  WeatherState get initialState => InitialWeatherState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is Fetch) {
      yield LoadingWeatherState();
      try {
        final SimpleWeahter simpleWeahter =
            await weatherRepository.weatherRepo();
        yield LoadedWeatherState(simpleWeahter: simpleWeahter);
      } catch (_) {
        yield ErrorState();
      }
    }
  }
}
