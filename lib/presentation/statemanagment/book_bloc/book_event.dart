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
  
  List<Object> get props => [page , limit];
}

class FetchBookDetailEvent extends BookEvent{
  final String bookId;

  const FetchBookDetailEvent({required this.bookId});

@override
   
  List<Object> get props => [bookId];
  
}

class AddRatingsEvent extends BookEvent{
  final double ratings;
  final String bookId;
  const AddRatingsEvent({required this.ratings ,required this.bookId});

  @override
  // TODO: implement props
  List<Object> get props => [ratings , bookId];
  
}
