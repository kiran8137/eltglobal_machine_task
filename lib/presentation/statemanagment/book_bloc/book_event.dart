part of 'book_bloc.dart';

sealed class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class FetchBooksEvent extends BookEvent{
 final  int page;
 final int limit;

 const FetchBooksEvent({required this.page , required this.limit});

 @override
  // TODO: implement props
  List<Object> get props => [page , limit];
}
