// To parse this JSON data, do
//
//     final match = matchFromJson(jsonString);

import 'dart:convert';

Game matchFromJson(String str) => Game.fromJson(json.decode(str));

String matchToJson(Game data) => json.encode(data.toJson());

class Game {
  Game({
    required this.count,
    required this.matches,
  });

  int count;
  List<MatchElement> matches;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        count: json["count"],
        matches: List<MatchElement>.from(
            json["matches"].map((x) => MatchElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "matches": List<dynamic>.from(matches.map((x) => x.toJson())),
      };
}

class MatchElement {
  MatchElement({
    required this.id,
    required this.competition,
    required this.season,
    required this.utcDate,
    required this.score,
    required this.homeTeam,
    required this.awayTeam,
  });

  int id;
  Competition competition;
  Season season;
  DateTime utcDate;
  Score score;
  Team homeTeam;
  Team awayTeam;

  factory MatchElement.fromJson(Map<String, dynamic> json) => MatchElement(
        id: json["id"],
        competition: Competition.fromJson(json["competition"]),
        season: Season.fromJson(json["season"]),
        utcDate: DateTime.parse(json["utcDate"]),
        score: Score.fromJson(json["score"]),
        homeTeam: Team.fromJson(json["homeTeam"]),
        awayTeam: Team.fromJson(json["awayTeam"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "competition": competition.toJson(),
        "season": season.toJson(),
        "utcDate": utcDate.toIso8601String(),
        "score": score.toJson(),
        "homeTeam": homeTeam.toJson(),
        "awayTeam": awayTeam.toJson(),
      };
}

class Team {
  Team({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Competition {
  Competition({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Score {
  Score({
    this.winner,
    required this.fullTime,
    required this.halfTime,
    required this.extraTime,
    required this.penalties,
  });

  dynamic winner;
  ExtraTime fullTime;
  ExtraTime halfTime;
  ExtraTime extraTime;
  ExtraTime penalties;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        winner: json["winner"],
        fullTime: ExtraTime.fromJson(json["fullTime"]),
        halfTime: ExtraTime.fromJson(json["halfTime"]),
        extraTime: ExtraTime.fromJson(json["extraTime"]),
        penalties: ExtraTime.fromJson(json["penalties"]),
      );

  Map<String, dynamic> toJson() => {
        "winner": winner,
        "fullTime": fullTime.toJson(),
        "halfTime": halfTime.toJson(),
        "extraTime": extraTime.toJson(),
        "penalties": penalties.toJson(),
      };
}

class ExtraTime {
  ExtraTime({
    this.homeTeam,
    this.awayTeam,
  });

  dynamic homeTeam;
  dynamic awayTeam;

  factory ExtraTime.fromJson(Map<String, dynamic> json) => ExtraTime(
        homeTeam: json["homeTeam"],
        awayTeam: json["awayTeam"],
      );

  Map<String, dynamic> toJson() => {
        "homeTeam": homeTeam,
        "awayTeam": awayTeam,
      };
}

class Season {
  Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    this.winner,
  });

  int id;
  DateTime startDate;
  DateTime endDate;
  dynamic winner;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["id"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        winner: json["winner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "winner": winner,
      };
}
