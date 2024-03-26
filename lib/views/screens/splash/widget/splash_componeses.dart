import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:lottie/lottie.dart';

class SplashComponeses extends StatelessWidget {
  const SplashComponeses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lotties/restaurant_splash.json',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              repeat: false,
              reverse: true,
              height: MediaQuery.of(context).size.height * 3 / 10,
              width: MediaQuery.of(context).size.width * 10 / 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 7 / 10,
                height: MediaQuery.of(context).size.height * 3 / 10,
                child: FadeInRight(
                  delay: const Duration(microseconds: 1500),
                  child: const Text(
                    "Hungry for success? Dive into our food seller app and elevate your culinary journey with ease.",
                    style: TextStyle(fontSize: 20, color: white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}