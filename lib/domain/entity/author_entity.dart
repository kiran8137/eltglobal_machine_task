
import 'package:equatable/equatable.dart';

class AuthorEntity extends Equatable{

  final String id;
  final String name;
  final String birthDate;
  final String biography;


  const AuthorEntity({required this.id, required this.name, required this.birthDate, required this.biography});
  
  @override
  // TODO: implement props
  List<Object?> get props => [id , name , birthDate , biography];
  }