import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokeinfo/common_widgets.dart';
import 'package:pokeinfo/constants.dart';
import 'package:pokeinfo/models/pokemon_details.dart';
import 'package:pokeinfo/models/pokemon_model.dart';
import 'package:pokeinfo/pokemon_details_page.dart';
import 'package:pokeinfo/welcome_page.dart';
import 'package:pokeinfo/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  final isFirstOpen;

  Home(this.isFirstOpen);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showWelcomePage = true;
  List<dynamic> _pokemonList = List();
  var url = "https://pokeapi.co/api/v2/pokemon?limit=100";

  Future<void> getPokemonsInfo() async {
print("Fetching pokemon info");
    http.Response response = await http.get(url);
    final jsonBody = json.decode(response.body);
    print(jsonBody["results"].length);
    if(response.statusCode == 200){
        var list = jsonBody["results"].map((data) => Pokemon.fromJson(data)).toList();
        setState(() {
          _pokemonList = list;
        });
    } else {
      throw Exception("Failed to fetch pokemon");
    }
  }
  @override
  void initState() {
    if (widget.isFirstOpen != null) _showWelcomePage = widget.isFirstOpen;
    getPokemonsInfo().catchError((onError){
      showSingleButtonDialog("Error", "${onError.toString()}", "OK", context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Pokemon Info'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () async {
                  var res = await showTwoButtonDialog("Sign out", "Do you realley want to sign out?", "Yes", "No", context);
                  if(res == "1"){
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    await prefs.setBool(loggedInKey, false);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) => Wrapper(false, widget.isFirstOpen)));
                  }
                },
                child: Icon(Icons.exit_to_app),
              ),
            ),
          ],
        ),
        body: _showWelcomePage
            ? WelcomePage()
            : _pokemonList.isEmpty ? Center(
                child: Text("Here we'll show all pokemon available"),
              )
        : ListView.builder(
          itemCount: _pokemonList.length,
          addAutomaticKeepAlives: false,
          itemBuilder: (context, index) {
            final item = _pokemonList[index];
            return Card(
              shadowColor: primaryColor,
              elevation: 1,
              child: ListTile(
                onTap: () async {
                  showLoading(context);
                  print(item.url);
                  var resp = await http.get(item.url);
                  Navigator.pop(context);
                  var details;
                  if(resp.statusCode == 200){
                    /*var jsonDecoded = json.decode(resp.body);
                    var types = jsonDecoded["types"];
                    print(types[0]["type"]["name"]);*/
                    details = Details.fromJson(json.decode(resp.body));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(details)));
                  } else {
                    showSingleButtonDialog("Error", "There was an error fetching Pokemon data", "OK", context);
                  }
                },
                title: Text(item.name ?? "No name provided",
                style: titleTextStyle,),
                //subtitle: Text(item.url ?? "No url provided"),
                leading: Icon(
                  Icons.adjust,
                  size: 24,
                  color: secondaryColor,
                ),
                trailing: Icon(
                  Icons.more_vert,
                  size: 24,
                  color: secondaryColor,
                ),
              ),
            );
          },
        )
    );
  }
}
