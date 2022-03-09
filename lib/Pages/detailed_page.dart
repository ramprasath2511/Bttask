import 'package:bttask/Model/match.dart';
import 'package:bttask/common/team.dart';
import 'package:bttask/common/transparent.dart';
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
        backgroundColor:  Color(0xFF6E62FF),
        title: Text("Scorecard"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const TransparentBackground(),
          Column(
            children: [
              //top header
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  // height: _size.height * 0.2,
                  width: double.infinity,
                  color: Color(0xFF6E62FF),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Text(
                            DateFormat("dd-MM-yyyy").format((widget.matches.utcDate)),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TeamLogoName(_size.width * 0.30, widget.matches.homeTeam, "Home"),
                          Container(
                            width: _size.width * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.matches.score.fullTime.homeTeam.toString(),
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white),
                                ),
                                Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white),
                                ),
                                Text(
                                  widget.matches.score.fullTime.awayTeam.toString(),
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          TeamLogoName(_size.width * 0.30, widget.matches.awayTeam,"Away" ),
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
                            Text(
                              widget.matches.score.halfTime.homeTeam.toString(),style: TextStyle(
                                fontSize: 30,
                                color: Colors.black)
                            ),
                            Expanded(
                              child: Center(
                                child: Text("Half-time",style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                              ),
                            ),
                            Text(
                                widget.matches.score.halfTime.awayTeam.toString(),style: TextStyle(
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
                                widget.matches.score.extraTime.homeTeam ?? "0",style: TextStyle(
                                fontSize: 30,
                                color: Colors.black)
                            ),
                            Expanded(
                              child: Center(
                                child: Text("Extra-time",style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                              ),
                            ),
                            Text(
                                widget.matches.score.extraTime.awayTeam ?? "0",style: TextStyle(
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
                                widget.matches.score.penalties.homeTeam ?? "0",style: TextStyle(
                                fontSize: 30,
                                color: Colors.black)
                            ),
                            Expanded(
                              child: Center(
                                child: Text("Penalties",style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                              ),
                            ),
                            Text(
                                widget.matches.score.penalties.awayTeam ?? "0",style: TextStyle(
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

