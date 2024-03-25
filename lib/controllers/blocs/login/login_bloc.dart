import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:foodie_fly_restaurant/controllers/api_services/authentication/api_callings.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SellerLoginEvent>(sellerLoginEvent);
  }
  FutureOr<void> sellerLoginEvent(SellerLoginEvent event, Emitter<LoginState> emit) async{
    final result = await ApiSellerAuthentication.login(event.email,event.password);
    if(result == "success"){
      print("success bloc worked");
      emit(SellerLoginSuccessState());
    }else if(result == "failed invalid fields or failed to Login"){
      print("failed invalid fields or failed to Login");
      emit(SellerLoginFailedInvalidFieldsOrFailedToLogin());
    }else if(result == "failed to parse body"){
      print("faild parse body");
      emit(SellerLoginFieldToParseBodyState());
    }else{
      print("Error bloc");
      emit(SellerLoginErrorState());
    }
  }
}
