import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/utils/text_styles.dart';

class ScreenAddDishes extends StatelessWidget {
  const ScreenAddDishes({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Container(
        color: Colors.red,
        margin:const EdgeInsets.all(20),
        child: const Center(
          child: Text("ADD DISH",style: boldWhite,),
        ),
           ),
     );
  }
}