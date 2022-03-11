import 'package:bttask/Model/match.dart';
import 'package:bttask/common/team.dart';
import 'package:bttask/common/backgroundscreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Scorecard extends StatefulWidget {

  final MatchElement matches;

  const Scorecard({Key? key, required this.matches}) : super(key: key);
  @override
  _ScorecardState createState() => _ScorecardState();
}

class _ScorecardState extends State<Scorecard> {

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color(0xFF6E62FF),
        title: Text(
          widget.matches.competition.name+" League",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const BackgroundScreen(),
          Column(
            children: [
              //top header
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Container(
                  padding: const EdgeInsets.all(12),
                   //height: _size.height * 0.2,
                  width: double.infinity,
                  color: const Color(0xFF6E62FF),
                  child: Column(
                    children: [
                      Text(
                        "Season : "+widget.matches.season.startDate.year.toString()+" - "+widget.matches.season.endDate.year.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Text(
                            DateFormat("dd-MM-yyyy").format((widget.matches.utcDate)),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TeamName(_size.width * 0.30, widget.matches.homeTeam, "Home"),
                          Container(
                            width: _size.width * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.matches.score.fullTime.homeTeam ?? "0",
                                  style: const TextStyle(
                                      fontSize: 50,
                                      color: Colors.white),
                                ),
                                const Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white),
                                ),
                                Text(
                                  widget.matches.score.fullTime.awayTeam ?? "0",
                                  style: const TextStyle(
                                      fontSize: 50,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          TeamName(_size.width * 0.30, widget.matches.awayTeam,"Away" ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //statistics list
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Center(
                                child: Text("Winner",style: TextStyle(
                                    fontSize: 20,fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Row(
                          children: [
                             Expanded(
                              child: Center(
                                child: Text(widget.matches.score.winner.toString(),style: TextStyle(
                                    fontSize: 20,fontWeight: FontWeight.bold,
                                    color: Colors.red)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Row(
                          children: [
                            Text(
                              widget.matches.score.halfTime.homeTeam ?? "0",style: const TextStyle(
                                fontSize: 30,
                                color: Colors.black)
                            ),
                            const Expanded(
                              child: Center(
                                child: Text("Half-time",style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                              ),
                            ),
                            Text(
                                widget.matches.score.halfTime.awayTeam  ?? "0",style: const TextStyle(
                                fontSize: 30,
                                color: Colors.black)
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Row(
                          key: const Key("extraTime"),
                          children: [
                            Text(
                                widget.matches.score.extraTime.homeTeam ?? "0",style: const TextStyle(
                                fontSize: 30,
                                color: Colors.black)
                            ),
                            const Expanded(
                              child: Center(
                                child: Text("Extra-time",style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                              ),
                            ),
                            Text(
                                widget.matches.score.extraTime.awayTeam ?? "0",style: const TextStyle(
                                fontSize: 30,
                                color: Colors.black)
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Row(
                          children: [
                            Text(

                                widget.matches.score.penalties.homeTeam ?? "0",style: const TextStyle(
                                fontSize: 30,
                                color: Colors.black)
                            ),
                            const Expanded(
                              child: Center(
                                child: Text("Penalties",style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                              ),
                            ),
                            Text(
                                widget.matches.score.penalties.awayTeam ?? "0",style: const TextStyle(
                                fontSize: 30,
                                color: Colors.black)
                            ),
                          ],
                        ),
                      ),
                      ]
                ),
                ),

                ),

            ],
          )
        ],
      ),
    );
  }

  }

