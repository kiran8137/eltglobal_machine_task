import 'package:elt_global_machine_task/data/model/book_model.dart';
import 'package:flutter/material.dart';

class BookImageWidget extends StatelessWidget {
  const BookImageWidget({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      color: const Color.fromARGB(255, 251, 225, 225),
      child: Center(
        child: SizedBox(
          height: 260,
          width: 170,
          child: Image.network(
            book.coverPictureURL,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

