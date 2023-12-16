import 'package:flutter/material.dart';
import 'package:weather_today_completed/utils/constants.dart';

import 'loading_screen.dart';

class CityScreen extends StatefulWidget {

  @override
  _CityScreenState createState() => _CityScreenState();
}

//u
class _CityScreenState extends State<CityScreen> {
  late String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context,
                          cityName); // This sends back the selected city
                    },
                    child: Image.asset(
                      'images/ic_back.png',
                      width: 32.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 24.0,
                ),
                child: TextField(
                  style: TextStyle(
                    fontFamily: 'Museo Moderno',
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    setState(() {
                      cityName = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoadingScreen(cityName: cityName);
                      },
                    ),
                  );
                },
                child: Text(
                  'Search Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
