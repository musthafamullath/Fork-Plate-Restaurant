import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

SalomonBottomBarItem salomonbottombaritem(ImageIcon imageIcon,String  text,) {
    return SalomonBottomBarItem(
      icon: imageIcon,
      title: FadeInUpBig(
          child:  Text(
        text,
        style:const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      )),
      selectedColor: white,
    );
  }