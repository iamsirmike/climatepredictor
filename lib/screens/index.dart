import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utils/util.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../services/model.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    try {
      setState(() {
        loading = true;
      });

      Location location = Location();
      await location.getUserLocation();

      GetLocationWeather getLocationWeather = GetLocationWeather(
          'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
      var weatherData = await getLocationWeather.getweatherData();
      WeatherModel weatherModel = WeatherModel();

      setState(() {
        temperature = weatherData['main']['temp'].toInt();
        cityName = weatherData['name'];
        main = weatherData['weather'][0]['main'];
        condition = weatherData['cod'];
        // condition = 800;
        img = weatherModel.updateBgPicture(condition);
        icon = weatherModel.updateIcon(condition);
        color = weatherModel.updateColor(condition);
        setState(() {
          loading = false;
          fl = true;
        });
      });
      print(condition);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        backgroundColor: Color(0xff8785F4),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: screenHeight(context, 0.35),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                '$main',
                                style: textStyle,
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            icon,
                            size: 70,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        '$temperature°',
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$cityName',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: screenHeight(context, 0.6125),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: fl ? img : AssetImage('assets/images/sunny.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
