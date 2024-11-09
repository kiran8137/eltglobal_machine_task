 

import 'package:elt_global_machine_task/presentation/main_screen/home_screen/widgets/books_list_widget.dart';
import 'package:elt_global_machine_task/presentation/main_screen/home_screen/widgets/search_text_form.dart';
import 'package:elt_global_machine_task/presentation/statemanagment/book_bloc/book_bloc.dart';
import 'package:elt_global_machine_task/presentation/common_widgets_component/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  

  @override
  void initState() {
    
    BlocProvider.of<BookBloc>(context).add(const FetchBooksEvent(page: 1, limit: 10));
    super.initState();
  }

   
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
            searchTextField(), //search field extracted as method
            const SizedBox(height: 10),
            BooksListWidget(scrollController: scrollController)  //shows the list of books
          ],
        ),
      )),
    );
  }

  
}

