import 'package:flutter/material.dart';
import 'package:pokeinfo/constants.dart';
import 'package:pokeinfo/pokemon_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome to POKEINFO",
              style: titleTextStyle,
            ),
            SizedBox(height: 8,),
            Text(
              "A place where you can find all pokemon related info, enjoy",
              textAlign: TextAlign.center,
              style: contentTextStyle,
            ),
            SizedBox(height: 8,),
            FlatButton(
              child: Text("Continue", style: titleTextStyle,),
              onPressed: () async {
                SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setBool(firstOpenKey, false);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) => Home(false)));
              },
            )
          ],
        ),
      ),
    );
  }
}
