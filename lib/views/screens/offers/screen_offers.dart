import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/app_bar_widget.dart';

import '../../../utils/text_styles.dart';

class ScreenOffers extends StatelessWidget {
  const ScreenOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:const PreferredSize(preferredSize: Size.fromHeight(70),
      child: AppBarWidget(title: "Offers")),
      body: Container(
        margin: const EdgeInsets.all(20),
        color: Colors.red,
        child: const Center(
          child: Text("ALL OFFERS",style: boldWhite,),
        ),
      ),
    );
  }
}