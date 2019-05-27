import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/src/model/simpleWeather.dart';
import 'package:http/http.dart' as http;

void main() {
  test("JsonText", () async {
    final String URL =
        "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22";
    final urlRes = await http.get(Uri.parse(URL));
    if(urlRes.statusCode==200){
      expect(getData(urlRes.body), isNotNull);
    }

    
  });
}
