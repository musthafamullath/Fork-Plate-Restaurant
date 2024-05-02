import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: yellow,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Text(title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 26,
                color: white,
              )),
        ),
      ),
    );
  }
}
