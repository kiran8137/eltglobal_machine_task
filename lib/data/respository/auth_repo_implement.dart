

import 'dart:convert';
import 'dart:math';

import 'package:elt_global_machine_task/domain/respository/auth_repo.dart';
import 'package:elt_global_machine_task/core/token_servies/token_servies.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepoImplement extends AuthenticationRepository{
  

  //function used to register a user
  @override
  Future<bool> registerUser({required String userName, required password}) async {
     try{
      const url ="https://assessment.eltglobal.in/api/auth/register";
      final uri = Uri.parse(url);
      final body = {
         "username":  userName,
         "password":  password 
      };
      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body)
        );
       
       final data = jsonDecode(response.body);
       print(data["result"]["access_token"]);
       



       if(response.statusCode == 201){
        //saves the access token to flutter secure storage
        await TokenServies().saveAccessToken(data["result"]["access_token"]).then((_)async{

           // stored to shared preference to set login status
           final sharedpref = await SharedPreferences.getInstance();
        sharedpref.setBool('userLogInStatus', true);
         
        });
        
       return true;
       }
       else if (response.statusCode == 400){
        return false;
       }else{
        return false;
       }

       
       
     }catch(error){
       debugPrint(error.toString());
      throw Exception(error);
     }
  }

}