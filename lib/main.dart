import 'dart:io';

import 'package:elt_global_machine_task/data/respository/auth_repo_implement.dart';
import 'package:elt_global_machine_task/data/respository/author_repo_implement.dart';
import 'package:elt_global_machine_task/data/respository/book_repo_implement.dart';
import 'package:elt_global_machine_task/data/respository/user_repo_implement.dart';
import 'package:elt_global_machine_task/presentation/statemanagment/auth_bloc/auth_bloc.dart';

import 'package:elt_global_machine_task/core/themes/light_theme.dart';
import 'package:elt_global_machine_task/presentation/statemanagment/author_bloc/author_bloc.dart';
import 'package:elt_global_machine_task/presentation/statemanagment/book_bloc/book_bloc.dart';
import 'package:elt_global_machine_task/presentation/statemanagment/user_bloc/user_bloc.dart';
import 'package:elt_global_machine_task/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(AuthenticationRepoImplement()),
        ),
        BlocProvider(
          create: (context) => UserBloc(UserRepoImplement()),
        ),
        BlocProvider(
          create: (context) => BookBloc(BookRepoImplement()),
        ),
         BlocProvider(
          create: (context) => AuthorBloc(AuthorRepoImplement()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        theme: lightMode,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
