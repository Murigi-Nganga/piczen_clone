import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piczen_clone/weather/bloc/weather_bloc.dart';
import 'package:piczen_clone/weather/repository/weather_repo.dart';
import 'package:piczen_clone/weather/view/weather_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepo: WeatherRepository()),
        child: WeatherScreen(),
      ),
    );
  }
}
