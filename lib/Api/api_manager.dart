import 'package:bttask/Model/match.dart';
import 'package:bttask/string.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const String token = "5a57573b8db449dfa37741d867843afe";

// Future<List<match>> getMatches(String code) async {
//   Response result = await get(
//       Uri.http('https://api.football-data.org/v2/matches');
//       headers: {"X-Auth-Token": token});


class API_Manger{
  Future<Match> getMatch({bool isRefresh = false}) async {
    var client = http.Client();
    var matchModel = null;
    var response = await client.get(Uri.parse(Links.base_url),
    headers: {"X-Auth-Token": Links.token});
    print(response);
      if(response.statusCode == 200){
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        matchModel = Match.fromJson(jsonMap);
      }
      return matchModel;
    }

}




