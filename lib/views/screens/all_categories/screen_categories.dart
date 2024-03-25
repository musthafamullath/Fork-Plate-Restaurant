import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/utils/text_styles.dart';

class ScreenCategories extends StatelessWidget {
  const ScreenCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        margin:const EdgeInsets.all(20),
        child: const Center(
          child: Text("ALL CATEGORIES",style: boldWhite,),
        ),
      ),
    );
  }
}