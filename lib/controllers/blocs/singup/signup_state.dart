part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

//for success
class SellerRegistrationSuccessState extends SignupState {}

//for failed
class SellerRegistrationFailedInvalidFeildsorFailedToRegisterState
    extends SignupState {}

class SellerRegistrationFieldToParseBodyState extends SignupState {}

//for error
class SellerRegistrationErrorState extends SignupState {}
