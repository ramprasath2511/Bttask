import 'package:bttask/Api/api_manager.dart';
import 'package:bttask/Model/match.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:convert';


class MatchList extends StatefulWidget {
  const MatchList({Key? key}) : super(key: key);

  @override
  _MatchListState createState() => _MatchListState();

}

class _MatchListState extends State<MatchList> {


  @override
  void initstate(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
        child:FutureBuilder<Match>(
                  future: API_Manger().getMatch(),
                  builder: ( context, snapshot) {
      if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
        return ListView.builder(
            itemCount: snapshot.data?.matches.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(5),
            itemBuilder: (context, i) {
              var matches = snapshot.data?.matches[i];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: <Widget>[
                      //first part of match details
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FittedBox(
                                child: Text(matches!.homeTeam.name,
                                    style: teamStyle),
                                fit: BoxFit.fitWidth),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(
                                  50, 0, 50, 0),
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                            FittedBox(
                                child: Text(matches.awayTeam.name,
                                    style: teamStyle),
                                fit: BoxFit.fitWidth)
                          ],
                        ),
                      ),

                      //second part of match details
                      Expanded(
                          child: Column(
                            children: const <Widget>[
                              FittedBox(
                                  child: Text("12:30"),
                                  fit: BoxFit.fitWidth),
                              FittedBox(
                                  child: Text("23-12-2021"),
                                  fit: BoxFit.fitWidth),
                            ],
                          ))

                    ],
                  ),
                ),
              );
            }
        );
      }}

                   ),
            //}
         // },
       // )
    );
  }

}



TextStyle teamStyle =
TextStyle(color: Colors.black, fontSize: 20, fontStyle: FontStyle.italic);
