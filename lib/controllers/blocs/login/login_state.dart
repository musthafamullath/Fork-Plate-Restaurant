part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
//for login
 class SellerLoginSuccessState extends LoginState{}
//for failed
class SellerLoginFailedInvalidFieldsOrFailedToLogin extends LoginState{}
class SellerLoginFieldToParseBodyState extends LoginState {}
//for error
class SellerLoginErrorState extends LoginState {}


