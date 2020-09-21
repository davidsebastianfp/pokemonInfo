import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokeinfo/login_page.dart';
import 'package:pokeinfo/pokemon_list_page.dart';
class Wrapper extends StatefulWidget {
  bool isLoggedIn;
  bool isFirstOpen;
  Wrapper(this.isLoggedIn, this.isFirstOpen);
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool goHome = false;
  bool isfirstOpen = true;

  @override
  void initState() {
    if(widget.isLoggedIn != null){
      goHome = widget.isLoggedIn;
    }
    if(widget.isFirstOpen != null){
      isfirstOpen = widget.isFirstOpen;
    }
  }
  @override
  Widget build(BuildContext context) {

    return goHome ? Home(isfirstOpen) : Login(isfirstOpen);
  }
}
