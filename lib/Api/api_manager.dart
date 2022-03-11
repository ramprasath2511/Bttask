import 'package:bttask/Model/match.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:intl/intl.dart';

const String token = "5a57573b8db449dfa37741d867843afe";

class API_Manger{
  Future<Game> getMatch(String type) async {
    var url = _urlFactory(type);
    var client = http.Client();
    var matchModel;
    var response = await client.get(Uri.parse(url),
    headers: {"X-Auth-Token": token});
    print(response);
      if(response.statusCode == 200){
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
         matchModel = Game.fromJson(jsonMap);
      }
      return matchModel;
    }

 String _urlFactory(String type) {
   String url ="";
   String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
   String past = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 10)));
   String future = DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 10)));

   switch (type) {
     case "current":
       url="http://api.football-data.org/v2/matches";
       break;
     case "past":
       url="http://api.football-data.org/v2/matches?dateFrom="+past+"&dateTo="+today;
       break;
     case "future":
       url="http://api.football-data.org/v2/matches?dateFrom="+today+"&dateTo="+future;
       break;
   }
 return url;
  }
}




