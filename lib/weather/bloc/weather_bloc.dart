import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:piczen_clone/weather/model/weather.dart';
import 'package:piczen_clone/weather/repository/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherRepository weatherRepo;

  WeatherBloc({required this.weatherRepo}) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
        emit(WeatherLoading());

        try{
          final weather = await weatherRepo.getWeather(event.city);
          emit(WeatherLoaded(weather: weather));
        } catch (error) {
          emit(WeatherError());
        }
    });
  }
}
