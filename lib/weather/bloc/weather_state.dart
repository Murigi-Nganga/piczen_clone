part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherState {

  const WeatherLoaded({required this.weather});
  final Weather weather;

  @override
  List<Object?> get props => [weather];
}

class WeatherError extends WeatherState {

  const WeatherError({required this.error});
  final String error;

  @override
  List<Object?> get props => [error];
}
