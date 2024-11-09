import 'package:elt_global_machine_task/data/model/book_model.dart';

abstract class BookRepository{

  Future<List<BookModel?>> fetchBooks(int page);

  Future<BookModel> fetchBookDetails(String id);

  Future<void> addRating(double rating , String bookId);
}