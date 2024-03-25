import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return FadeInDownBig(
      child: Text(
        text,
        style:const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}