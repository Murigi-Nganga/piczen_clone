import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piczen_clone/weather/bloc/weather_bloc.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({super.key});

  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    Future<void> submitCity() async {
      if (_cityController.text.trim().isEmpty) {
        return showDialog<void>(
          context: context,
          builder: (BuildContext ctx) => const AlertDialog(
            title: Text('Error'),
            content: Text(
              'Please add a city',
            ),
          ),
        );
      }

      weatherBloc.add(
        FetchWeather(city: _cityController.text),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _cityController,
              decoration: const InputDecoration(
                hintText: 'Enter a city',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: submitCity,
                child: const Text('Submit'),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
                  return Column(
                    children: [
                      WeatherItemText(
                        weatherElement: 'Humidity',
                        elementValue: '${state.weather.humidity} g/m3',
                      ),
                      const SizedBox(height: 8),
                      WeatherItemText(
                        weatherElement: 'Pressure',
                        elementValue: '${state.weather.pressure} Pa',
                      ),
                      const SizedBox(height: 8),
                      WeatherItemText(
                        weatherElement: 'Temperature',
                        elementValue: '${state.weather.temp} °C',
                      ),
                    ],
                  );
                } else if (state is WeatherError) {
                  return Text(state.error);
                } else {
                  // state is WeatherInitial
                  return const Text('No weather data has been requested!');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherItemText extends StatelessWidget {
  const WeatherItemText({
    required this.weatherElement,
    required this.elementValue,
    super.key,
  });

  final String weatherElement;
  final String elementValue;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: '$weatherElement: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: elementValue,
          ),
        ],
      ),
    );
  }
}
