

import 'dart:convert';
import 'dart:developer';

import 'package:elt_global_machine_task/data/model/author_model.dart';
import 'package:elt_global_machine_task/domain/respository/author_repo.dart';
import 'package:http/http.dart' as http;
class AuthorRepoImplement extends AuthorRepository{

  // Function to fetch the list of authors 
  @override
  Future<List<AuthorModel>> fetchAuthors() async{

    try{
      var url = "https://assessment.eltglobal.in/api/authors";
      final response = await http.get(Uri.parse(url));

      //checking for success status 
      if(response.statusCode == 200){
        final decodedData = jsonDecode(response.body);
        final List<dynamic> jsonList = decodedData["result"];

        final result = jsonList.map((author)=> AuthorModel.fromJson(author)).toList();
        return result;
      }
      //checking for error status
      if(response.statusCode == 400){
        return [];
      }
      throw Exception();
    }catch(error){
      log(error.toString());
      throw Exception();
    }
  }

  
}