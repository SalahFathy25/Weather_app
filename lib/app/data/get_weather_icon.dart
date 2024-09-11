import 'package:flutter/material.dart';

class GetWeatherIcon extends StatelessWidget {
  final int code;

  const GetWeatherIcon({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'assets/images/weather_app/sunny.png',
          width: 230,
          height: 230,
        );

      case >= 300 && < 400:
        return Image.asset(
          'assets/images/weather_app/sunny.png',
          width: 230,
          height: 230,
        );

      case >= 400 && < 500:
        return Image.asset(
          'assets/images/weather_app/sunny.png',
          width: 230,
          height: 230,
        );

      case >= 500 && < 600:
        return Image.asset(
          'assets/images/weather_app/sunny.png',
          width: 230,
          height: 230,
        );

      case >= 600 && < 700:
        return Image.asset(
          'assets/images/weather_app/sunny.png',
          width: 230,
          height: 230,
        );

      case >= 700 && < 800:
        return Image.asset(
          'assets/images/weather_app/sunny.png',
          width: 230,
          height: 230,
        );

      case == 800:
        return Image.asset(
          'assets/images/weather_app/sunny.png',
          width: 230,
          height: 230,
        );

      case > 800 && < 804:
        return Image.asset(
          'assets/images/weather_app/sunny.png',
          width: 230,
          height: 230,
        );

      default:
        return Image.asset(
          'assets/images/weather_app/sunny.png',
          width: 230,
          height: 230,
        );
    }
  }
}
