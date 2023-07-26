part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeather extends WeatherEvent {

  const FetchWeather({required this.city});
  final String city;

  @override
  List<Object?> get props => [city];
}
