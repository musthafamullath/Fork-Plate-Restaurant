import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/app_bar_widget.dart';
import '../../../utils/text_styles.dart';

class ScreenOrders extends StatelessWidget {
  const ScreenOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarWidget(title: "Orders"),
      ),
      body: Container(
        color: Colors.green,
        margin: const EdgeInsets.all(20),
        child: const Center(
          child: Text(
            "ALL ORDERS",
            style: boldWhite,
          ),
        ),
      ),
    );
  }
}
