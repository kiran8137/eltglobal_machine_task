import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elt_global_machine_task/domain/respository/user_repo.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
   final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserInitial()) {
     
     on<SaveUserAuthenticatedStatus>(saveUserAuthenticatedStatus);
     on<CheckUserAuthenticationStatus>(checkUserAuthenticationStatus);
     
  }

  FutureOr<void> saveUserAuthenticatedStatus(SaveUserAuthenticatedStatus event, Emitter<UserState> emit)async{

  }

  FutureOr<void> checkUserAuthenticationStatus(CheckUserAuthenticationStatus event, Emitter<UserState> emit)async{
    try{
      var result = await userRepository.getUserLoggedStatus('userLogInStatus');
      if(result == true){
        emit(UserAuthenticated());
      }else{
        emit(UserUnAuthenticated());
      }
    }catch(error){
      log(error.toString());
    }
  }
}
