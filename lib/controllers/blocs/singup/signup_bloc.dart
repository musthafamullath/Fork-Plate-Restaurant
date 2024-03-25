import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:foodie_fly_restaurant/controllers/api_services/authentication/api_callings.dart';
import 'package:foodie_fly_restaurant/models/restaurant.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SellerSignupEvent>(sellerSignupEvent);
  }

  FutureOr<void> sellerSignupEvent(SellerSignupEvent event, Emitter<SignupState> emit)async {
    final  result = await ApiSellerAuthentication.register(event.restaurantRegisteration);
    if(result == "Success"){
      print("success bloc worked");
      emit(SellerRegistrationSuccessState());
    }
    else if(result == "failed invalid fields or failed to register"){
      print("failed invalid fields or failed to register");
       emit(SellerRegistrationFailedInvalidFeildsorFailedToRegisterState());
    }else if(result == "failed to parse body"){
      print("failed to parse body");
      emit(SellerRegistrationFieldToParseBodyState());
    }else{
      print("Error bloc");
      emit(SellerRegistrationErrorState());
    }
  }
}
