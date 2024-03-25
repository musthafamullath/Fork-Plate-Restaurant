import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/views/screens/login_and_register/screen_login_and_registeration.dart';
import 'package:foodie_fly_restaurant/views/screens/main/screen_main_page.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    checkUserLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.withBlue(10),
      body: Center(
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
                height: MediaQuery.of(context).size.height*3/10,
                width: MediaQuery.of(context).size.width *10/10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,110,0,0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 7/ 10,
                  height: MediaQuery.of(context).size.height*3/10,
                  child: FadeInRight(
                    delay: const Duration(microseconds: 1500),
                    child: const Text(
                      "Hungry for success? Dive into our food seller app and elevate your culinary journey with ease.",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> checkUserLogin(context)async{
    final preferences = await SharedPreferences.getInstance();
    final userLoggedIn = preferences.get('LOGIN');
    if(userLoggedIn == null || userLoggedIn == false){
      await Future.delayed(const Duration(seconds: 3));
      goToLoginPage(context);
    }else{
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  ScreenMainPage(),)
      );
    }
  }
    Future<void>goToLoginPage(context)async{
    await Future.delayed(const Duration(seconds: 3),);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ScreenLoginRestration(),)
    );
  }
}
