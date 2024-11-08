part of 'book_bloc.dart';

sealed class BookState extends Equatable {
  const BookState();
  
  @override
  List<Object> get props => [];
}

final class FetchBookInitial extends BookState {}

final class FetchBookSuccessState extends BookState{
 final List<BookModel?> books;

  FetchBookSuccessState({required this.books});

  @override
   
  List<Object> get props => [books];
}

final class FetchBookEmptyState extends BookState{}
