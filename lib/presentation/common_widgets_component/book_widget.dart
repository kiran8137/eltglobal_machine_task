

import 'package:elt_global_machine_task/data/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookWidget extends StatelessWidget {
    const BookWidget({
    super.key,
      required this.book
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 300,
      width: 180,
       
      decoration: const BoxDecoration(
        color: Colors.white,
        
      ),
    
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 170,
              height: 170,
              child: Image.network(book.coverPictureURL)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight:FontWeight.w500
                ),
                ),
                Text(book.authorName ?? "",
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight:FontWeight.w500,
                  color: const Color(0xFF5C5C5C)
                ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star , color: Color(0xFFFFC700),size: 15,),
                    book.ratings.isEmpty ? 
                     Text("0.0",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight:FontWeight.w500,
                      color: const Color(0xFF5C5C5C)
                    ),
                    ):
                    Text("${book.ratings[0]['rating']}",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight:FontWeight.w500,
                      color: const Color(0xFF5C5C5C)
                    ),
                    ),
                  ],
                ),
                Text('₹ ${book.price}',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight:FontWeight.w600,
                  color: Colors.black
                ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}