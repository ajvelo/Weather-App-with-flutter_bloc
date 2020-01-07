import 'package:flutter/material.dart';
import 'package:flutter_weather/bloc/simple_bloc_delegate.dart';
import 'package:flutter_weather/data_provider/weather_api_client.dart';
import 'package:flutter_weather/repository/weather_repository.dart';
import 'package:flutter_weather/widgets/weather.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(App(weatherRepository: weatherRepository));
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Weather',
        home: Weather(
          weatherRepository: weatherRepository,
        ));
  }
}
