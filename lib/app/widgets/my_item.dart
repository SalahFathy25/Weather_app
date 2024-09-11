import 'package:flutter/material.dart';
import 'package:weather_app/app/widgets/my_sized_box.dart';

Widget MyItem(
    {required String image, required String label, required String value}) {
  return Row(
    children: [
      Image.asset(
        image,
        width: 45,
        height: 45,
      ),
      mySizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ],
  );
}
