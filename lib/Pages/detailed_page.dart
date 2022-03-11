import 'package:bttask/Model/match.dart';
import 'package:bttask/utils/team.dart';
import 'package:bttask/utils/background_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Scorecard extends StatefulWidget {

  final MatchElement? matches;

  const Scorecard({Key? key, required this.matches}) : super(key: key);
  @override
  _ScorecardState createState() => _ScorecardState();
}

class _ScorecardState extends State<Scorecard> {


  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;
    Score? score = widget.matches?.score;
    String winner = score?.winner?.toString() ?? "-";
    String homeScore =score?.fullTime.homeTeam?.toString() ?? "0";
    String awayScore = score?.fullTime.awayTeam?.toString() ?? "0";
    String hHalfScore = score?.halfTime.homeTeam?.toString()?? "0";
    String aHalfScore = score?.halfTime.awayTeam?.toString()?? "0";
    String hExtraScore = score?.extraTime.homeTeam?.toString()?? "0";
    String aExtraScore = score?.extraTime.awayTeam?.toString()?? "0";
    String hPenalities = score?.penalties.homeTeam?.toString()?? "0";
    String aPenalities = score?.penalties.awayTeam?.toString()?? "0";
    String leagueName = widget.matches?.competition.name.toString() ?? "League";

    var seasonStartYr = widget.matches!.season.startDate.year.toString();
    var seasonEndYr = widget.matches!.season.endDate.year.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6E62FF),
        title: Text(
          leagueName+" League",
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
                        "Season : "+seasonStartYr+" - "+seasonEndYr,
                        style: const TextStyle(color: Colors.white),
                      ),

                      const SizedBox(
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
                            DateFormat("dd-MM-yyyy").format((widget.matches!.utcDate)),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TeamDetails(_size.width * 0.30, widget.matches!.homeTeam, "Home"),
                          SizedBox(
                            width: _size.width * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  homeScore ,
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
                                  awayScore,
                                  style: const TextStyle(
                                      fontSize: 50,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          TeamDetails(_size.width * 0.30, widget.matches!.awayTeam,"Away" ),
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
                          children: const [
                            Expanded(
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
                                child: Text(winner ,style: const TextStyle(
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
                              hHalfScore,style: const TextStyle(
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
                                aHalfScore ,style: const TextStyle(
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
                                hExtraScore ,style: const TextStyle(
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
                                aExtraScore ,style: const TextStyle(
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

                                hPenalities ,style: const TextStyle(
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
                                aPenalities ,style: const TextStyle(
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

