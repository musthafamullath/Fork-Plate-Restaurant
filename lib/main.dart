import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/SellerSalesPanalTotel/seller_sales_panaltotel_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/SellerSalesPanaldaily/seller_sales_panal_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/category/category_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/dish/dish_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/login/login_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/offer/offer_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/profile/profile_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/singup/signup_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/cubits/toggle_password/toggle_password_cubit.dart';
import 'package:foodie_fly_restaurant/controllers/cubits/toggle_repassword/toggle_repassword_cubit.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:foodie_fly_restaurant/views/screens/splash/screen_splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider( 
      providers: [
        BlocProvider(create: (context) => SignupBloc(),),
        BlocProvider(create: (context) => LoginBloc(),),
        BlocProvider(create: (context) => BottomNavigationBloc(),),
        BlocProvider(create: (context) => ProfileBloc(),),
        BlocProvider(create: (context) => TogglepasswordCubit(),),
        BlocProvider(create: (context) => ToggleRepasswordCubit(),),
        BlocProvider(create: (context) => CategoryBloc(),),
        BlocProvider(create: (context) => DishBloc(),),
        BlocProvider(create: (context) => OfferBloc(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foodie Fly Restaurant',
        theme: ThemeData(
          primaryColor: orangePointWithblue,
          primarySwatch: materialColor,
          useMaterial3: true,
          fontFamily: 'K2D',
        ),
        home:const SplashScreenPage(),
      ),
    );
  }
}

