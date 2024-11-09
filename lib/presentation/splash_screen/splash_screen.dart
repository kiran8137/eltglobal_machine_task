import 'dart:async';

import 'package:elt_global_machine_task/presentation/statemanagment/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(CheckUserAuthenticationStatus()); //triggering event to get the user logged status
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if(state is UserAuthenticated){
           Timer(const Duration(seconds: 5), ()=> context.go('/homescreen'));
          }
          if(state is UserUnAuthenticated){
            Timer(const Duration(seconds: 5), ()=> context.go('/registerscreen'));
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 255, 162, 55),
              Color.fromARGB(255, 236, 114, 0),
              Color.fromARGB(255, 236, 114, 0)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Center(
              child: Image.asset("assets/Logo.png"),
            ),
          );
        },
      ),
    );
  }
}
