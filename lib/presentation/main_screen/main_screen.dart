

import 'package:elt_global_machine_task/presentation/main_screen/authors_screen/authors_screen.dart';
import 'package:elt_global_machine_task/presentation/main_screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
    MainHome({super.key});

final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

final List<Widget> screens = [
  const HomeScreen(),
    AuthorsScreen()
] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        onTap: (index){
          debugPrint(index.toString());
          currentIndex.value = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'Home'
            ),
             BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label:'Authors'
            )
        ],
       
        ),
        body: ValueListenableBuilder
        (valueListenable: currentIndex, 
        builder:(context, value, child){
          return screens[value];
        }
        ),
    );
  }
}