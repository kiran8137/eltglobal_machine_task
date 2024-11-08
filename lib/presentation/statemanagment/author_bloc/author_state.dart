part of 'author_bloc.dart';

sealed class AuthorState extends Equatable {
  const AuthorState();
  
  @override
  List<Object> get props => [];
}

final class FetchAuthorInitial extends AuthorState {}

final class FetchAuthorSuccess extends AuthorState{

  final List<AuthorModel> authors;

  const FetchAuthorSuccess({required this.authors});

  @override
 
  List<Object> get props => [authors];
}

final class FetchAuthorEmpty extends AuthorState{}
