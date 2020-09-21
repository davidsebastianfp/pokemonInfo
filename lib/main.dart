import 'package:flutter/material.dart';
import 'package:pokeinfo/constants.dart';
import 'package:pokeinfo/login_page.dart';
import 'package:pokeinfo/pokemon_list_page.dart';
import 'package:pokeinfo/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLoggedIn = prefs.getBool(loggedInKey);
  var isFirstOpen = prefs.getBool(firstOpenKey);
  runApp(MyApp(isLoggedIn: isLoggedIn, isFirstOpen: isFirstOpen,));
}

class MyApp extends StatelessWidget {
  final isLoggedIn;
  final isFirstOpen;

  MyApp({this.isLoggedIn, this.isFirstOpen});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(isLoggedIn, isFirstOpen),
    );
  }
}
