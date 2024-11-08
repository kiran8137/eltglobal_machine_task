part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


class RegisterEvent extends AuthEvent{
  final String userName;
  final String password;

  RegisterEvent({required this.userName, required this.password});

   
}
