

import 'package:elt_global_machine_task/data/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SizedBox bookNameAndRatingsWidget(BuildContext context, BookModel book) {
    return SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    70 /
                                    100,
                                child: Text(
                                  book.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                        width: 1.5,
                                        color: const Color.fromARGB(
                                            255, 240, 240, 240))),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xFFFFC700),
                                      size: 18,
                                    ),
                                    book.ratings.isEmpty
                                        ? Text(
                                            "0.0",
                                            style: GoogleFonts.inter(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    const Color(0xFF5C5C5C)),
                                          )
                                        : Text(
                                            book.ratings[0]['rating'].toString(),
                                            style: GoogleFonts.inter(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    const Color(0xFF5C5C5C)),
                                          ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
  }