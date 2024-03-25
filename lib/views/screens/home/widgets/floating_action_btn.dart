import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';


class FloatingActionBTN extends StatelessWidget {
  const FloatingActionBTN({
    super.key, required this.icon, required this.string,required this.onPressed,
  });
  final IconData icon;
  final String string;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      child: FloatingActionButton(
           splashColor: Colors.orange.withBlue(300),
            backgroundColor: Colors.white,
            
            onPressed:onPressed,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon),
                Text(string,style:const TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)
              ],
            )
          ),
    );
  }
}
