

import 'package:elt_global_machine_task/data/model/author_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({
    super.key,
    required this.circleColor,
    required this.author,
    required this.textColor,
  });

  final Color circleColor;
  final AuthorModel author;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, top: 10),
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
                          color: const Color(0xFF5C5C5C),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
