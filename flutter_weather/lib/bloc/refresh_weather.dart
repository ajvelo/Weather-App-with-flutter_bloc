import 'package:flutter/material.dart';
import 'package:flutter_weather/bloc/weather_event.dart';

class RefreshWeather extends WeatherEvent {
  final String city;

  RefreshWeather({@required this.city})
      : assert(city != null),
        super([city]);
}
