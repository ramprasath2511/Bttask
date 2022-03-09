import 'package:bttask/Bloc/match_bloc.dart';
import 'package:bttask/Model/match.dart';
import 'package:bttask/common/transparent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detailed_page.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({Key? key}) : super(key: key);

  @override
  _MatchListScreenState createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  final bloc = MatchBloc();

  @override
  void initState() {
    //refreshController = RefreshController();
    bloc.eventSink.add(Operations.fetch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //background
          TransparentBackground(),
          //main column contains top header and list
          Column(
            children: [
              //top header container
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Container(
                  height: _size.height * 0.27,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          "Images/slliderbg.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF6E62FF).withOpacity(0.3),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text("Campionship league",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Season:"),
                    Text("2012"),
                    // dropdownColor:,
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder<List<MatchElement>>(
                    stream: bloc.counterStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, i) {
                            MatchElement matches = snapshot.data![i] as MatchElement;
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (builder) => Scorecard(matches:matches)));
                              },
                              child: Container(
                                height: 70,
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xFF6E62FF).withOpacity(0.8),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(24),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        matches.homeTeam.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        matches.score.fullTime.homeTeam.toString() +" - "+ matches.score.fullTime.awayTeam.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        matches.awayTeam.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
