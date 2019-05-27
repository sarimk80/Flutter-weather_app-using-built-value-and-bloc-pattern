import 'package:flutter_weather_app/src/model/simpleWeather.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class WeatherApi {
  final String baseUrl =
      "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22";

  final http.Client httpClint;

  WeatherApi({@required this.httpClint}) : assert(httpClint != null);

  Future<SimpleWeahter> getApiData() async {
    final res = await this.httpClint.get(Uri.parse(baseUrl));

    if (res.statusCode != 200) {
      return null;
    }
    return getData(res.body);
  }
}
