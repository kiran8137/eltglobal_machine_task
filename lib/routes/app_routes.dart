

import 'package:elt_global_machine_task/presentation/auth_screen/register_screen.dart';
import 'package:elt_global_machine_task/presentation/main_screen/home_screen/home_screen.dart';
import 'package:elt_global_machine_task/presentation/main_screen/main_home.dart';
import 'package:elt_global_machine_task/presentation/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes{

 static final router = GoRouter(
  initialLocation: '/splashscreen',
  routes: [
    GoRoute(
        
      path: '/splashscreen',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
        
      path: '/registerscreen',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
       
      path: '/homescreen',
      builder: (context, state) => MainHome(),
    ),
  ],
);
}