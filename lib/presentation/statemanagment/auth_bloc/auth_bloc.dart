import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elt_global_machine_task/domain/respository/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository authenticanRepository;
  AuthBloc(this.authenticanRepository) : super(AuthInitial()) {
     
     on<RegisterEvent>(registerUser);
     on<LoginEvent>(logInUser);

  }

  FutureOr<void> registerUser(RegisterEvent event, Emitter<AuthState> emit) async{
    try{
    final response =  await authenticanRepository.registerUser(userName: event.userName, password: event.password);
     if(response == true){
      emit(AuthSuccessState());
     }else{
      emit(AuthErrorState());
     }
    }catch(error){
      log(error.toString());
    }
  }



  FutureOr<void> logInUser(LoginEvent event, Emitter<AuthState> emit) async{

  }
}
