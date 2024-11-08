import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elt_global_machine_task/data/model/author_model.dart';
import 'package:elt_global_machine_task/domain/respository/author_repo.dart';
import 'package:equatable/equatable.dart';

part 'author_event.dart';
part 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  final AuthorRepository authorRepository;
  AuthorBloc(this.authorRepository) : super(FetchAuthorInitial()) {
    
    on<FetchAuthorsEvent>(fetchAuthors);
  }

  FutureOr<void> fetchAuthors(FetchAuthorsEvent event, Emitter<AuthorState> emit) async{
    try{
    final result = await authorRepository.fetchAuthors();
    if(result.isNotEmpty){
      emit(FetchAuthorSuccess(authors: result));
    }else{
      emit(FetchAuthorEmpty());
    }
    }catch(error){
      log(error.toString());
    }
  }
}
