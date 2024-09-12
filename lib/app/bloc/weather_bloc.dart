import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

String API = "001165935d90bce7f75e0549db1d9607";

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory(API, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure('Unable to fetch weather data. Please try again.'));
      }
    });

    on<SearchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory(API, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByCityName(event.cityName);
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure('City not found. Please enter a valid city name.'));
      }
    });
  }
}
