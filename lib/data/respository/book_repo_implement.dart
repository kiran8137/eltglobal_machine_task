import 'dart:convert';
import 'dart:developer';

import 'package:elt_global_machine_task/data/model/book_model.dart';
import 'package:elt_global_machine_task/domain/respository/book_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookRepoImplement extends BookRepository{
  @override
  Future<List<BookModel?>> fetchBooks(int page)async {
     try{
      var url = 
"https://assessment.eltglobal.in/api/books/date-range?from=1980-01-10&to=2024-10-10";
      final uri = Uri.parse(url);

       final response = await http.get(uri);
      

      if(response.statusCode == 200){
         Map<String , dynamic> decodedData = json.decode(response.body);
         
        final List<dynamic> jsonList = decodedData["result"];
        log(jsonList.toString());
     final result =  jsonList.map((book) => BookModel.fromJson(book)).toList();
     
     
    
    final books = await Future.wait(result.map((book)async{
         var response = await http.get(Uri.parse("https://assessment.eltglobal.in/api/authors/${book.authorId}"));
       if(response.statusCode == 200){
        final jsonName = jsonDecode(response.body);
        final authorName = jsonName["result"]["name"];
        return book.copyWith(authorName);
       }
    }));
     debugPrint(books.toString());

     
     
     
     return books;
      }else{
        throw Exception();
      }
     }catch(error){
      log(".....${error.toString()}");
      throw Exception();
     }
  }

    
}