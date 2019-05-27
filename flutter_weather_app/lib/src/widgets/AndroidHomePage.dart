import 'package:flutter/material.dart';
import 'package:flutter_weather_app/src/bloc/bloc.dart';
import 'package:flutter_weather_app/src/repository/WeatherApi.dart';
import 'package:flutter_weather_app/src/repository/WeatherRepository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class AndroidHomePage extends StatefulWidget {
  final String title;
  AndroidHomePage({Key key, this.title}) : super(key: key);

  _AndroidHomePageState createState() => _AndroidHomePageState();
}

class _AndroidHomePageState extends State<AndroidHomePage> {
  WeatherBloc _bloc;
  WeatherRepository weatherRepository =
      WeatherRepository(weatherApi: WeatherApi(httpClint: http.Client()));

  @override
  void initState() {
    _bloc = WeatherBloc(weatherRepository: weatherRepository);
    _bloc.dispatch(Fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, WeatherState state) {
          if (state is LoadingWeatherState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is LoadedWeatherState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    state.simpleWeahter.name,
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(
                    state.simpleWeahter.main.temp.toString(),
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                  Text(state.simpleWeahter.weather[0].main),
                  Text(state.simpleWeahter.weather[0].description)
                ],
              ),
            );
          } else if(state is ErrorState){
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
