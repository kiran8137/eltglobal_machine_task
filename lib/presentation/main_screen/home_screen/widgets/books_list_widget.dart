import 'package:elt_global_machine_task/presentation/statemanagment/book_bloc/book_bloc.dart';
import 'package:elt_global_machine_task/presentation/common_widgets_component/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BooksListWidget extends StatelessWidget {
  const BooksListWidget({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromARGB(255, 240, 240, 240),
        width: double.infinity,
        child: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            if(state is FetchBookInitial){
              return const Center(child: CircularProgressIndicator());
            }
            else if(state is FetchBookSuccessState){
              return GridView.builder(
              
                controller: scrollController,
                itemCount: state.books.length ,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  final book = state.books[index];
                  return   GestureDetector(
                    onTap: (){
                      BlocProvider.of<BookBloc>(context).add(FetchBookDetailEvent(bookId: book.id));
                      context.go('/bookdetailscreen');
                    },
                    child: BookWidget(book: book!));
                });
            }else if(state is FetchBookEmptyState){
              return Center( child: Text("Can't able to load'"));
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
            
          },
        ),
      ),
    );
  }
}
