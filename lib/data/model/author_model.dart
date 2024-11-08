import 'package:elt_global_machine_task/domain/entity/author_entity.dart';

class AuthorModel extends AuthorEntity {
  const AuthorModel(
      {required super.id,
      required super.name,
      required super.birthDate,
      required super.biography});


  factory AuthorModel.fromJson(Map<dynamic , dynamic> json){
    return AuthorModel(
      id: json["id"] ?? "", 
      name: json["name"] ?? "", 
      birthDate: json["birthDate"] ?? "", 
      biography: json["biography"] ?? ""
      );
  }
}
