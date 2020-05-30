import 'package:http/http.dart' as http;
import 'dart:convert';

class   GetLocationWeather {
  String url;
  GetLocationWeather(this.url);

  Future getweatherData() async {
    http.Response response = await http.get(url);
    var data = response.body;
    return jsonDecode(data);
  }
}
