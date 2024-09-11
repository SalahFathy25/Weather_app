import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/data/get_weather_icon.dart';
import 'package:weather_app/widgets/my_item.dart';
import 'package:weather_app/widgets/my_sized_box.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  String formatDateTime(String inputDateTime) {
    try {
      DateTime dateTime = DateTime.parse(inputDateTime);
      String dayOfWeek = DateFormat('EEEE').format(dateTime);
      String day = DateFormat('d').format(dateTime);
      String time = DateFormat('h:mm a').format(dateTime);
      return '$dayOfWeek $day • $time';
    } catch (e) {
      return 'Invalid date';
    }
  }

  String formatRiseAndSet(String dateTimeStr) {
    try {
      DateTime dateTime = DateTime.parse(dateTimeStr);
      return DateFormat.jm().format(dateTime);
    } catch (e) {
      return 'Invalid time';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherSuccess) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFFAB40),
                    Colors.deepPurple,
                    Colors.black87,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    mySizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '📍: ${state.weather.country ?? ''}',
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              ' ${state.weather.areaName ?? ''}',
                              style: const TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    mySizedBox(height: 30),
                    GetWeatherIcon(code: state.weather.weatherConditionCode!),
                    mySizedBox(height: 20),
                    Text(
                      '${state.weather.temperature?.celsius?.round() ?? '--'} °C',
                      style: const TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      state.weather.weatherMain ?? '',
                      style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    mySizedBox(height: 20),
                    Text(
                      formatDateTime('${state.weather.date}'),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    mySizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyItem(
                          image: 'assets/images/weather_app/sunrise.png',
                          label: 'Sunrise',
                          value: formatRiseAndSet('${state.weather.sunrise}'),
                        ),
                        MyItem(
                          image: 'assets/images/weather_app/sunset.png',
                          label: 'Sunset',
                          value: formatRiseAndSet('${state.weather.sunset}'),
                        ),
                      ],
                    ),
                    const Divider(height: 30, endIndent: 10, indent: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyItem(
                          image: 'assets/images/weather_app/max_temp.png',
                          label: 'Temp Max',
                          value:
                              '${state.weather.tempMax?.celsius?.round() ?? '--'} °C',
                        ),
                        MyItem(
                          image: 'assets/images/weather_app/min_temp.png',
                          label: 'Temp Min',
                          value:
                              '${state.weather.tempMin?.celsius?.round() ?? '--'} °C',
                        ),
                      ],
                    ),
                    mySizedBox(height: 40),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
