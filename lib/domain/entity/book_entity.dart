
import 'package:equatable/equatable.dart';

class BookEntity extends Equatable{

  final String id;
  final String title;
  final String description;
  final String publishedDate;
  final String authorId;
  final String? authorName;
  final String coverPictureURL;
  final String price;
  final List<dynamic> ratings;
  final String starCount;

  const BookEntity({required this.id, required this.title, required this.description, required this.publishedDate, required this.authorId ,required this.authorName, required this.coverPictureURL, required this.price, required this.ratings, required this.starCount});
  
  @override
   
  List<Object?> get props => [id,title,description,publishedDate,authorId, authorName,  coverPictureURL,price,ratings,starCount];
  
}