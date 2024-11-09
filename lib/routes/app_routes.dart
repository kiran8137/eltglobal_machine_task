

import 'package:elt_global_machine_task/presentation/auth_screen/login_screen.dart';
import 'package:elt_global_machine_task/presentation/auth_screen/register_screen.dart';
import 'package:elt_global_machine_task/presentation/book_detail_screen/book_detail_screen.dart';
import 'package:elt_global_machine_task/presentation/main_screen/home_screen/home_screen.dart';
import 'package:elt_global_machine_task/presentation/main_screen/main_screen.dart';
import 'package:elt_global_machine_task/presentation/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes{

//routes to manage navigation within the application

 static final router = GoRouter(
  initialLocation: '/splashscreen',
  routes: [
    GoRoute(
        
      path: '/splashscreen',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
        
      path: '/registerscreen',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
       
      path: '/homescreen',
      builder: (context, state) => MainHome(),
    ),
    GoRoute(
       
      path: '/bookdetailscreen',
      builder: (context, state) => const BookDetailScreen(),
    ),

    GoRoute(
       
      path: '/loginscreen',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
}