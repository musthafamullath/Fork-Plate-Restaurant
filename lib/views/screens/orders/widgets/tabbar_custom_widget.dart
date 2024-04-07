import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/utils/text_styles.dart';
import 'package:foodie_fly_restaurant/views/screens/orders/widgets/tabbar_text_widget.dart';

class TabBarWidgetCustom extends StatelessWidget {
  const TabBarWidgetCustom({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orange.withBlue(300),
          border: BorderDirectional(
            bottom: BorderSide(
              color: Colors.orange.shade800,
              width: 10,
            ),
          ),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12))),
      child: AppBar(
        backgroundColor: Colors.orange.withBlue(300),
        title: FadeInDownBig(child: const Text('Orders', style: bigBoldWhite)),
        centerTitle: true,
        bottom: const TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicatorWeight: 5,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TabBarWidget(
                text: 'Orders',
              ),
            ),
            TabBarWidget(
              text: 'Cooking',
            ),
            TabBarWidget(
              text: 'Ready',
            ),
            TabBarWidget(
              text: 'Delivered',
            ),
          ],
        ),
      ),
    );
  }
}
