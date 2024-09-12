part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final Position position;

  const FetchWeather(this.position);

  @override
  List<Object> get props => [position];
}

class SearchWeather extends WeatherEvent {
  final String cityName;

  const SearchWeather(this.cityName);

  @override
  List<Object> get props => [cityName];
}
