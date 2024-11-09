part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

//event to Register a user
class RegisterEvent extends AuthEvent{
  final String userName;
  final String password;

  RegisterEvent({required this.userName, required this.password});

   
}

class LoginEvent extends AuthEvent{

  final String userName;
  final String password;

  LoginEvent({required this.userName, required this.password});

  
}

class LogOutEvent extends AuthEvent{}
