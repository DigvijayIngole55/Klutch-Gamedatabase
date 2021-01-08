import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'GamePageSearch.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String title;
  String api = 'https://api.rawg.io/api/games/';
  var redirect;
  var slug;
  var datadecode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0XFF101010),
      appBar: AppBar(backgroundColor: Color(0xFF1F1F1F)),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                title = value;
                title = title.toLowerCase();
                title = title.replaceAll(' ', '-');
                print(title);
              },
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: ('Search game name'),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                hintStyle: TextStyle(
                  fontFamily: 'Bungee',
                  color: Colors.black54,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async{

                http.Response response = await http.get(api+title);
                String data = response.body;
                var datadecode = jsonDecode(data);
                redirect = datadecode['redirect'];
                if (redirect == true) {
                  title = datadecode['slug'];
                  http.Response response = await http.get(api+title);
                  String data = response.body;
                  var recode = jsonDecode(data);
                  print(recode['description_raw']);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => GamePageScreen(gamedata: recode)));
                }
                else{
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => GamePageScreen(gamedata: datadecode)));
                  print(datadecode['description_raw']);
                }
              },
              child: Container(
                margin: EdgeInsets.all(30.0),
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                color: Color(0XFF3F3F3F),
                child: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'mokoto',
                    fontSize: 20.0
                  ),
                ),
              ),
            ),
            Image.asset('images/Klutch.png')
          ],
        ),
      ),
    );
  }
}
