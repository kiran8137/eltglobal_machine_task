import 'package:elt_global_machine_task/domain/entity/book_entity.dart';
import 'package:flutter/material.dart';

class BookModel extends BookEntity {
  const BookModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.publishedDate,
      required super.authorId,
      required super.authorName,
      required super.coverPictureURL,
      required super.price,
      required super.ratings,
      required super.starCount});


    factory BookModel.fromJson(Map<dynamic, dynamic> json){
      return  BookModel(
        id: json['id'].toString(), 
        title: json['title'].toString(), 
        description: json['description'].toString(), 
        publishedDate: json['publishedDate'].toString(), 
        authorId: json['authorId'].toString(), 
        authorName: json[''].toString(),
        coverPictureURL: json['coverPictureURL'].toString(), 
        price: json['price'].toString(), 
        ratings: json['ratings'] ?? "", 
        starCount: json['starCount'].toString()
        )
        ;
    }

    BookModel copyWith(String? authorName){
       
      return BookModel(id: id, 
      title: title, 
      description: description, 
      publishedDate: publishedDate, 
      authorId: authorId, 
      authorName : authorName ?? this.authorName,
      coverPictureURL: coverPictureURL, 
      price: price, 
      ratings: ratings, 
      starCount: starCount
      );
      
    }
}
