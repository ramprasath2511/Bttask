import 'dart:async';
import 'dart:convert';

import 'package:bttask/Model/match.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class APIManger {
  Future<Game?> getMatchDetails(String type) async {
    var url = _urlFactory(type);
    var client = http.Client();
    Game? matchModel;
    const String token = "5a57573b8db449dfa37741d867843afe";

    var response =
        await client.get(Uri.parse(url), headers: {"X-Auth-Token": token});
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      matchModel = Game.fromJson(jsonMap);
    }
    return matchModel;
  }

  String _urlFactory(String type) {
    String url = "";
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String pastDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 10)));
    String futureDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().add(const Duration(days: 10)));

    switch (type) {
      case "current":
        url = "http://api.football-data.org/v2/matches";
        break;
      case "past":
        url = "http://api.football-data.org/v2/matches?dateFrom=" +
            pastDate +
            "&dateTo=" +
            today;
        break;
      case "future":
        url = "http://api.football-data.org/v2/matches?dateFrom=" +
            today +
            "&dateTo=" +
            futureDate;
        break;
    }
    return url;
  }
}
