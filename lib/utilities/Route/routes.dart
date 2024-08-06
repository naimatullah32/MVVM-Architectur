

import 'package:flutter/material.dart';
import 'package:mvvm/View_Screen/Sign_Up.dart';
import 'package:mvvm/View_Screen/splash_screen.dart';
import 'package:mvvm/utilities/Route/routes_name.dart';
import '../../View_Screen/home_screen.dart';
import '../../View_Screen/login_Viwe.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){

      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => SplashScreen());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());

          case RoutesName.login:
            return MaterialPageRoute(builder: (BuildContext context) => loginScreen());

      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => SignUpView());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(child: Text("No route defined")),
          );
        });
    }
  }
}