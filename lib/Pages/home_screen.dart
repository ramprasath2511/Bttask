
import 'package:bttask/Bloc/matches_bloc.dart';
import 'package:bttask/Model/match.dart';
import 'package:bttask/common/backgroundscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'detailed_page.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({Key? key}) : super(key: key);

  @override
  _MatchListScreenState createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {


  @override
  void initState() {
    BlocProvider.of<MatchesBloc>(context).add(Fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //background
          const BackgroundScreen(),
          //main column contains top header and list
          Column(
            children: [
              //top header container
              ClipRRect(
                borderRadius: const BorderRadius.only(
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
                      BlocBuilder<MatchesBloc, MatchesState>(
  builder: (context, state) {
    return Container(
                        child:  Center(
                          child: Text(state.matchElements.matches[0].competition.name,style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),),
                        ),
                      );
  },
),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: BlocBuilder<MatchesBloc, MatchesState>(
  builder: (context, state) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    Text("Season:"),
                    // Text(state.matchElements.matches[0].season.startDate.year.toString()+" - "+state.matchElements.matches[0].season.endDate.year.toString()),
                    // dropdownColor:,
                  ],
                );
  },
),
              ),
              Expanded(
                child: BlocBuilder<MatchesBloc, MatchesState>(
                    builder: (context, state) {
                      if (state.matchElements!=null) {
                        return ListView.builder(
                          itemCount: state.matchElements.matches.length,
                          itemBuilder: (context, i) {
                            MatchElement matches = state.matchElements.matches[i];
                            return InkWell(
                              key: const Key("lists"),
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
                                  color: const Color(0xFF6E62FF).withOpacity(0.8),
                                  borderRadius: const BorderRadius.all(
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
                                        style: const TextStyle(
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
                                        style: const TextStyle(
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
                                        style: const TextStyle(
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
