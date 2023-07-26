import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piczen_clone/weather/bloc/weather_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state){
            if(state is WeatherLoading) {
              return const CircularProgressIndicator();
            } else if(state is WeatherLoaded) {
              return Text('${state.weather.humidity} mmHg');
            } else if(state is WeatherError) {
              return const Text('An error occurred!');
            } else {
              // state is WeatherInitial
              return const Text('No weather data has been requested!');
            }
          },
        ),
      ),
    );
  }
}
