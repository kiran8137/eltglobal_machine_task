

import 'package:elt_global_machine_task/presentation/statemanagment/book_bloc/book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

SizedBox ratingBottomSheet(rating, BuildContext context, bookId) {
    return SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Add Ratings',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),
                          ),
                        const Divider(thickness: 0.5,color: Color.fromARGB(117, 158, 158, 158),),
                           RatingBar(
                            itemCount: 5,
                           // allowHalfRating: true,
                            ratingWidget: RatingWidget(
                              full: const Icon(Icons.star , color: Colors.yellow,), 
                              half: const Icon(Icons.star_half, color: Colors.yellow,), 
                              empty: const Icon(Icons.star, color: Colors.grey,)
                              ), 
                            onRatingUpdate: (double ratings){
                                rating = ratings;
                              
                             
                            }
                            ),
                             const Divider(thickness: 0.5,color: Color.fromARGB(117, 158, 158, 158),),
                            GestureDetector(
                              onTap: (){
                                 BlocProvider.of<BookBloc>(context).add(AddRatingsEvent(ratings: rating , bookId: bookId));
                                 Navigator.pop(context);
                                 BlocProvider.of<BookBloc>(context).add(FetchBookDetailEvent(bookId: bookId));
                              },
                              child: Container(
                                //padding: EdgeInsets.symmetric(horizontal: 15),
                                width: double.infinity,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(7)
                                ),
                                child: Center(
                                  child: Text('Submit',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                  ),
                                  ),
                                ),
                              ),
                            )
                        ],  
                      ),
                    ),
                  );
  }