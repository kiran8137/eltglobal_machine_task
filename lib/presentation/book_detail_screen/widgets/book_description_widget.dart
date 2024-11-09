
  import 'package:elt_global_machine_task/data/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Expanded bookDescriptionWidget(BookModel book) {
    return Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                book.description,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Colors.black),
                              ),
                            ));
  }