part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccessState extends AuthState{}

final class AuthErrorState extends AuthState{}