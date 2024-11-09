import 'dart:math';

import 'package:elt_global_machine_task/data/model/author_model.dart';
import 'package:elt_global_machine_task/presentation/main_screen/authors_screen/widgets/authors_widget.dart';
import 'package:elt_global_machine_task/presentation/statemanagment/auth_bloc/auth_bloc.dart';
import 'package:elt_global_machine_task/presentation/statemanagment/author_bloc/author_bloc.dart';
import 'package:elt_global_machine_task/presentation/common_widgets_component/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorsScreen extends StatefulWidget {
  AuthorsScreen({super.key});

  @override
  State<AuthorsScreen> createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> {
  final random = Random();
  
  //colors used in circle
  final List<Color> circleColors = [
    const Color.fromARGB(64, 255, 153, 0),
    const Color.fromARGB(72, 142, 11, 190),
    const Color.fromARGB(77, 76, 175, 79)
  ];

  //colors used in text inside the circle
  final List<Color> textColors = [
    const Color.fromARGB(255, 143, 86, 0),
    const Color.fromARGB(255, 85, 6, 113),
    const Color.fromARGB(255, 39, 112, 41)
  ];
  
  @override
  void initState() {
    BlocProvider.of<AuthorBloc>(context).add(FetchAuthorsEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: commonAppBar(context, 'Authors'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
        child: BlocConsumer<AuthorBloc, AuthorState>(
          listener: (context, state) {},
          builder: (context, state) {
            
            if(state is FetchAuthorInitial){
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is FetchAuthorEmpty){
              return const Center(child: Text('Something Went Wrong'),);
            }else if(state is FetchAuthorSuccess){
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 15),
                itemCount: state.authors.length,
                itemBuilder: (context, index) {
                  final circleColor = circleColors[index % circleColors.length];
                  final textColor =  textColors[index % textColors.length];
                  final author = state.authors[index];

                  return AuthorWidget(circleColor: circleColor, author: author, textColor: textColor); // author widget
                }); 
            }else{
             return  const Center(child: Text('Something Went Wrong'),);
            }
            
          },
        ),
      )),
    );
  }
}

