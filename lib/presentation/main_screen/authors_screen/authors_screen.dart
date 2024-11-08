import 'dart:math';

import 'package:elt_global_machine_task/presentation/statemanagment/auth_bloc/auth_bloc.dart';
import 'package:elt_global_machine_task/presentation/statemanagment/author_bloc/author_bloc.dart';
import 'package:elt_global_machine_task/presentation/widgets_component/app_bar.dart';
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

  final List<Color> circleColors = [
    Color.fromARGB(64, 255, 153, 0),
    Color.fromARGB(72, 142, 11, 190),
    const Color.fromARGB(77, 76, 175, 79)
  ];

  final List<Color> textColors = [
    Color.fromARGB(255, 143, 86, 0),
    Color.fromARGB(255, 85, 6, 113),
    Color.fromARGB(255, 39, 112, 41)
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
        padding: EdgeInsets.only(left: 15.0, right: 15, top: 10),
        child: BlocConsumer<AuthorBloc, AuthorState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is FetchAuthorInitial){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is FetchAuthorEmpty){
              return Center(child: Text('Something Went Wrong'),);
            }else if(state is FetchAuthorSuccess){
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: state.authors.length,
                itemBuilder: (context, index) {
                  final circleColor = circleColors[index % circleColors.length];
                  final textColor =  textColors[index % textColors.length];
                  final author = state.authors[index];
                  return Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                          //color: Colors.green,
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                              color: const Color.fromARGB(255, 240, 240, 240))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: circleColor),
                                child: Center(
                                  child: Text(author.name[0],
                                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18 ,color: textColor)
                                  ),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  author.name,
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    author.biography,
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                        color: Color(0xFF5C5C5C),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                }); 
            }else{
             return  Center(child: Text('Something Went Wrong'),);
            }
            
          },
        ),
      )),
    );
  }
}
