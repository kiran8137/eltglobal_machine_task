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


final class FetchBookDetailIntial extends BookState{}

final class FetchBookDetailSuccess extends BookState{
  final BookModel book;

 const FetchBookDetailSuccess({required this.book});

  @override
  // TODO: implement props
  List<Object> get props => [book];
}

final class FetchBookDetailEmpty extends BookState{}
