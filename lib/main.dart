import 'package:book_ur_book/screens/home.dart';
import 'package:book_ur_book/screens/intro.dart';
import 'package:book_ur_book/screens/login.dart';
import 'package:book_ur_book/screens/signup.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget root',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/', //to mention root screen of app
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Intro(),
        LoginScreen.ROUTE_LOGIN: (context) => LoginScreen(),
        SignupScreen.ROUTE_SIGNUP: (context) => SignupScreen(),
        HomeScreen.ROUTE_NEXT: (context) => HomeScreen(),
        //DetailPage.routeName: (ctx) => DetailPage(),
        //CartScreen.routeName: (ctx) => CartScreen(),
      },
    );
  }
}
