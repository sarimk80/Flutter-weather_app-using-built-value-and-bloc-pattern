import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/src/bloc/bloc.dart';
import 'package:flutter_weather_app/src/repository/WeatherApi.dart';
import 'package:flutter_weather_app/src/repository/WeatherRepository.dart';
import 'package:http/http.dart' as http;

class IosHomePage extends StatefulWidget {
  final String title;
  IosHomePage({Key key, this.title}) : super(key: key);

  _IosHomePageState createState() => _IosHomePageState();
}

class _IosHomePageState extends State<IosHomePage> {
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: SafeArea(
        child: BlocBuilder(
          bloc: _bloc,
          builder: (BuildContext context, WeatherState state) {
            if (state is LoadingWeatherState) {
              return Center(child: CupertinoActivityIndicator());
            }
            if (state is LoadedWeatherState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      state.simpleWeahter.name,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(state.simpleWeahter.main.temp.toString()),
                    Text(state.simpleWeahter.weather[0].main),
                    Text(
                      state.simpleWeahter.weather[0].description,
                      style: TextStyle(color: CupertinoColors.activeOrange),
                    )
                  ],
                ),
              );
            } else if (state is ErrorState) {
              return Center(child: Text("Error"));
            } else {
              return Center(
                child: Text("Error"),
              );
            }
          },
        ),
      ),
    );
  }
}
