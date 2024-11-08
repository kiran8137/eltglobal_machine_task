
import 'dart:developer';

import 'package:elt_global_machine_task/domain/respository/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepoImplement extends UserRepository{
  @override
  Future<bool?> getUserLoggedStatus(String key) async {

    try{
       final sharedpref = await SharedPreferences.getInstance();
       var result =  sharedpref.getBool('userLogInStatus');
     return result;
    }catch(error){
      log(error.toString());
      throw Exception();
    }
    
  }

  @override
  Future<void> saveUserLoggedStatus(bool loggedStatus) async {
     final sharedpref = await SharedPreferences.getInstance();
        sharedpref.setBool('userLogInStatus',loggedStatus);
  }

  
}