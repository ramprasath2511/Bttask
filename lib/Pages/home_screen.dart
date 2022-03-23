import 'package:bttask/Bloc/matches_bloc.dart';
import 'package:bttask/Model/match.dart';
import 'package:bttask/utils/background_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'detailed_page.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({Key? key}) : super(key: key);

  @override
  _MatchListScreenState createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  @override
  void initState() {
    BlocProvider.of<MatchesBloc>(context).add(const Fetch("current"));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundScreen(),
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: SizedBox(
                  height: _size.height * 0.27,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          "Images/coverpic.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6E62FF).withOpacity(0.3),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "FootBall Matches",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Positioned(
                        height: _size.height * 0.39,
                        left: _size.height * 0.03,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<MatchesBloc>(context)
                                      .add(const Fetch("past"));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    "<-- Past Matches",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Positioned(
                        height: _size.height * 0.39,
                        right: _size.height * 0.03,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<MatchesBloc>(context)
                                      .add(const Fetch("future"));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    "Future Matches -->",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: BlocBuilder<MatchesBloc, MatchesState>(
                    builder: (context, state) {
                  if (state.matchElements?.matches != null) {
                    return ListView.builder(
                      itemCount: state.matchElements?.matches.length,
                      itemBuilder: (context, i) {
                        MatchElement? matches = state.matchElements?.matches[i];
                        String homeScore =
                            matches?.score.fullTime.homeTeam?.toString() ?? "0";
                        String awayScore =
                            matches?.score.fullTime.awayTeam?.toString() ?? "0";

                        return InkWell(
                          key: const Key("lists"),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) =>
                                    Scorecard(matches: matches)));
                          },
                          child: Container(
                            height: _size.height * 0.15,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6E62FF).withOpacity(0.8),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            child: Column(children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 3,
                                                vertical: 1,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border.all(
                                                    color: Colors.red),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(3),
                                                ),
                                              ),
                                              child: const Text(
                                                "Home",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    Expanded(
                                      child: Column(children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                          ),
                                          child: Text(
                                            DateFormat("hh:mm")
                                                .format((matches!.utcDate)),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Expanded(
                                        child: Column(children: [
                                      Text(
                                        DateFormat("dd-MM-yyyy")
                                            .format((matches.utcDate)),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.lightGreenAccent,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ])),
                                  ]),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      matches.homeTeam.name,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          border:
                                              Border.all(color: Colors.green),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        child: Column(children: [
                                          Text(
                                            homeScore + " - " + awayScore,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ])),
                                  ),
                                  Expanded(
                                    child: Text(
                                      matches.awayTeam.name,
                                      maxLines: 1,
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
                            ]),
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
