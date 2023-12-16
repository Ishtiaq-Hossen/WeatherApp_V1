import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/network.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  final String cityName;

  LoadingScreen({required this.cityName});

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

//u
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData(widget.cityName);
  }

  void getLocationData(String cityName) async {
    var weatherData = await getCityWeather(cityName);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
            cityName: cityName,
          );
        },
      ),
    );
  }

  Future<dynamic> getCityWeather(String cityName) async {
    final apiKey =
        '931aa452caaa6eb6552cde6cd099a6ec'; // Replace with your OpenWeatherMap API key

    // If the cityName is empty, set a default city ("Dhaka" in this case)
    String city = cityName.isEmpty ? "Dhaka" : cityName;

    final weatherUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final weatherUrl2='https://api.openweathermap.org/data/2.5/weather?q=auto:ip&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(weatherUrl);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.09),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
