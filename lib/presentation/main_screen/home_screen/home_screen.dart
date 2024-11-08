 
import 'dart:ui';

import 'package:elt_global_machine_task/presentation/statemanagment/book_bloc/book_bloc.dart';
import 'package:elt_global_machine_task/presentation/widgets_component/app_bar.dart';
import 'package:elt_global_machine_task/presentation/widgets_component/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
   scrollController.addListener(() {
      // if (scrollController.position.pixels >=
      //         scrollController.position.maxScrollExtent &&
      //     !scrollController.position.outOfRange) {
      //   context.read<BookBloc>().add(const FetchBooksEvent(page: 1, limit: 10));
      // }
    });
    BlocProvider.of<BookBloc>(context).add(FetchBooksEvent(page: 1, limit: 10));
    super.initState();
  }

  void scrollListener() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: commonAppBar(context, 'Books App'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
        child: Column(
          children: [
            SizedBox(
              height: 37,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  labelText: 'Search...',
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
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
                          return   BookWidget(book: book!);
                        });
                    }else if(state is FetchBookEmptyState){
                      return Center( child: Text("Can't able to load'"));
                    }
                    else{
                      return Text('Some thing went wrong');
                    }
                    
                  },
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
