import 'package:bttask/Model/match.dart';
import 'package:bttask/string.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const String token = "5a57573b8db449dfa37741d867843afe";

class API_Manger{
  Future<Game> getMatch() async {
    var client = http.Client();
    var matchModel;
    var response = await client.get(Uri.parse(Links.base_url),
    headers: {"X-Auth-Token": Links.token});
    print(response);
      if(response.statusCode == 200){
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
         matchModel = Game.fromJson(jsonMap);
      }
      return matchModel;
    }

}




