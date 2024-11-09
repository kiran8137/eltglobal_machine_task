import 'package:elt_global_machine_task/data/model/book_model.dart';
import 'package:elt_global_machine_task/presentation/book_detail_screen/widgets/book_description_widget.dart';
import 'package:elt_global_machine_task/presentation/book_detail_screen/widgets/add_rating_button.dart';
import 'package:elt_global_machine_task/presentation/book_detail_screen/widgets/book_image_widget.dart';
import 'package:elt_global_machine_task/presentation/book_detail_screen/widgets/bookname_rating_widget.dart';
import 'package:elt_global_machine_task/presentation/book_detail_screen/widgets/ratings_bottomsheet.dart';
import 'package:elt_global_machine_task/presentation/statemanagment/book_bloc/book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bookId;
    var rating;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
            onPressed: () {
              // BlocProvider.of<BookBloc>(context).add(const FetchBooksEvent(page: 1, limit: 10));
              context.go('/homescreen');
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '& 800',
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ratingBottomSheet(
                          rating, context, bookId); //extracted as method
                    });
              },
              child: const AddRatingButton(), //button for showing bottom sheet
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: BlocConsumer<BookBloc, BookState>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          if (state is FetchBookDetailIntial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchBookDetailEmpty) {
            return const Center(
              child: Text("Can't able to load"),
            );
          } else if (state is FetchBookDetailSuccess) {
            final book = state.book;
            bookId = book.id;
            DateTime parsedDate = DateTime.parse(book.publishedDate); 
            String formatteDate = DateFormat('MMMM dd, yyyy').format(parsedDate); //convert date in seo 
            return Column(
              children: [

                BookImageWidget(
                    book: book), //widget that shows the image of the book


                BookDetailWidget(
                    book: book,
                    formatteDate:
                        formatteDate) //widget that shows the detail of the book (name, ratings, description etc..)
              ],
            );
          } else {
            return const Center(
              child: Text("Can't able to load"),
            );
          }
        },
      )),
    );
  }
}

class BookDetailWidget extends StatelessWidget {
  const BookDetailWidget({
    super.key,
    required this.book,
    required this.formatteDate,
  });

  final BookModel book;
  final String formatteDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bookNameAndRatingsWidget(context,
                  book), //widgets that shows book name and ratings extracted as method

              book.authorName!.isNotEmpty
                  ? Text(
                      "by ${book.authorName} ",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400, fontSize: 15),
                    )
                  : const SizedBox(),
              const SizedBox(height: 5),
              Text(
                "Published date: $formatteDate",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: const Color(0xFF5C5C5C)),
              ),
              const SizedBox(height: 5),
              bookDescriptionWidget(
                  book) // book description widget extracted as method
            ],
          ),
        ),
      ),
    );
  }
}
