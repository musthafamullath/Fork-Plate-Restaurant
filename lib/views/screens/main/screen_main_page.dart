import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:foodie_fly_restaurant/views/screens/home/screen_home.dart';
import 'package:foodie_fly_restaurant/views/screens/offers/screen_offers.dart';
import 'package:foodie_fly_restaurant/views/screens/orders/screen_orders.dart';
import 'package:foodie_fly_restaurant/views/screens/profile/screen_profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final List screens = [
    const ScreenHome(),
    const ScreenOffers(),
    const ScreenOrders(),
    const ScreenProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: screens[state.index],
          bottomNavigationBar: SalomonBottomBar(
            backgroundColor: Colors.orange.shade800,
            selectedItemColor: Colors.white,
            curve: Curves.decelerate,
            currentIndex: state.index,
            onTap: (value) => context
                .read<BottomNavigationBloc>()
                .add(BottomNavigationEvent(index: value)),
            items: [
              SalomonBottomBarItem(
                icon: const ImageIcon(AssetImage('assets/icons/foods.png')),
                title: FadeInUpBig(
                    child: const Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                selectedColor: Colors.white,
              ),
              SalomonBottomBarItem(
                icon: const ImageIcon(AssetImage('assets/icons/cart.png')),
                title: FadeInUpBig(
                    child: const Text(
                  'Offers',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                selectedColor: Colors.white,
              ),
              SalomonBottomBarItem(
                icon:
                    const ImageIcon(AssetImage('assets/icons/restaurant.png')),
                title: FadeInUpBig(
                    child: const Text(
                  'Orders',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                selectedColor: Colors.white,
              ),
              SalomonBottomBarItem(
                icon: const ImageIcon(AssetImage('assets/icons/profile.png')),
                title: FadeInUpBig(
                    child: const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                selectedColor: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
