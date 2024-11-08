import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elt_global_machine_task/data/model/book_model.dart';
import 'package:elt_global_machine_task/domain/respository/book_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;
  BookBloc(this.bookRepository) : super(FetchBookInitial()) {
    

    on<FetchBooksEvent>(fetchBooks);
  }

  FutureOr<void> fetchBooks(FetchBooksEvent event, Emitter<BookState> emit) async{
    try{
      final result = await bookRepository.fetchBooks(1);
      if(result.isNotEmpty){
        emit(FetchBookSuccessState(books: result));
      }else{
        emit(FetchBookEmptyState());
      }
    }catch(error){
      log(error.toString());
    }
  }
}