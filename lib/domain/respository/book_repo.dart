import 'package:elt_global_machine_task/data/model/book_model.dart';

abstract class BookRepository{

  Future<List<BookModel?>> fetchBooks(int page);
}