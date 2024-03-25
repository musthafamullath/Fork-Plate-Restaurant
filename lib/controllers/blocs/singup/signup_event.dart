part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}
class SellerSignupEvent extends SignupEvent {
  final RestaurantRegisteration restaurantRegisteration;
  SellerSignupEvent({required this.restaurantRegisteration});
}

