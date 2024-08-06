import 'package:flutter/material.dart';
import 'package:mvvm/View_model/auth_view_model.dart';
import 'package:mvvm/View_model/home_view_model.dart';
import 'package:mvvm/View_model/user_view-model.dart';
import 'package:mvvm/utilities/Route/routes.dart';
import 'package:mvvm/utilities/Route/routes_name.dart';
import 'package:provider/provider.dart';
import 'package:mvvm/main.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
          // ChangeNotifierProvider(create: (_)=> HomeViewModel())
        ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    ),
    );
  }
}
