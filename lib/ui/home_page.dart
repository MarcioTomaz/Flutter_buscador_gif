import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _search = "";

  int _offSet = 0;

  _getGif() async{

    http.Response response;

    String _urlTrending = "https://api.giphy.com/v1/gifs/trending?"
        "api_key=R3I8B9TTW4tarBbkOBD0U47I72c4ChDq&limit=20&rating=g";

    String _urlSearch = "https://api.giphy.com/v1/gifs/search?api_key=R3I8B9TTW"
        "4tarBbkOBD0U47I72c4ChDq&q=$_search&limit=20&offset=$_offSet&rating=g&lang=en";

    if(_search == null){
      response = await http.get(Uri.parse(_urlTrending));
    }else {
      response = await http.get(Uri.parse(_urlSearch));
    }
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getGif().then((map){
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body:  Column(
         children: <Widget>[
           Padding(padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Pesquise aqui!",
                labelStyle: TextStyle(color:Colors.white,),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white,fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
           )
         ],
      ),
    );
  }
}
