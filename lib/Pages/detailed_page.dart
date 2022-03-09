import 'package:bttask/Model/match.dart';
import 'package:bttask/common/team.dart';
import 'package:bttask/common/transparent.dart';
import 'package:flutter/material.dart';

class Scorecard extends StatefulWidget {




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
                          "24/12/2021",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TeamLogoName(_size.width * 0.25),
                          Container(
                            width: _size.width * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "0",
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
                                  "1",
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          TeamLogoName(_size.width * 0.25),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //statistics list
              Expanded(
                child: Column(
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
                              "25",
                            ),
                            Expanded(
                              child: Center(
                                child: Text("Full-time"),
                              ),
                            ),
                            Text(
                              "5",
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
                              "25",
                            ),
                            Expanded(
                              child: Center(
                                child: Text("Half-time"),
                              ),
                            ),
                            Text(
                              "5",
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
                              "25",
                            ),
                            Expanded(
                              child: Center(
                                child: Text("Extra-time"),
                              ),
                            ),
                            Text(
                              "5",
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
                              "25",
                            ),
                            Expanded(
                              child: Center(
                                child: Text("Penalities"),
                              ),
                            ),
                            Text(
                              "5",
                            ),
                          ],
                        ),
                      ),
                      ]
                ),

                ),

            ],
          )
        ],
      ),
    );
  }

  }

