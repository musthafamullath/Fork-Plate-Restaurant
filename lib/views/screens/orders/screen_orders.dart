import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:foodie_fly_restaurant/views/screens/orders/widgets/tabbar_custom_widget.dart';

class ScreenOrders extends StatelessWidget {
  const ScreenOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize:  Size.fromHeight(100),
            child: TabBarWidgetCustom(text: "Orders")),
        body: TabBarView(children: [
          Container(
            margin: EdgeInsets.all(20),
            color: amber,
            child: Center(
                child: Text(
              "Orders",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:white),
            )),
          ),
          Container(
            margin: EdgeInsets.all(20),
            color: red,
            child: Center(
                child: Text(
              "Cooking",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: white),
            )),
          ),
          Container(
            margin: EdgeInsets.all(20),
            color: black,
            child: Center(
                child: Text(
              "Ready",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: white),
            )),
          ),
          Container(
            margin: EdgeInsets.all(20),
            color: green,
            child: Center(
                child: Text(
              "Delivered",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: white),
            )),
          ),
        ]),
      ),
    );
  }
}
