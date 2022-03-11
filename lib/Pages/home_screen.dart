
import 'package:bttask/Bloc/matches_bloc.dart';
import 'package:bttask/Model/match.dart';
import 'package:bttask/common/backgroundscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'detailed_page.dart';
import 'package:intl/intl.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({Key? key}) : super(key: key);

  @override
  _MatchListScreenState createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {


  @override
  void initState() {
    BlocProvider.of<MatchesBloc>(context).add(Fetch("current"));
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
                      Container(
                        child:  const Center(
                          child: Text("FootBall Matches",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),),
                        ),
                      ),

                     Positioned(height: 270,left: 25,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
    InkWell(
      onTap: (){
        BlocProvider.of<MatchesBloc>(context).add(Fetch("past"));
      },
    child :Container(
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
                             child: Text(
                               "<-- Past Matches",
                               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                             ),
                           ),
    ),

                         ]
                     ),),
                      Positioned(height: 270,right: 25,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  BlocProvider.of<MatchesBloc>(context).add(Fetch("future"));
                                },
                              child :Container(
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
                                child: Text(
                                  "Future Matches -->",
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                              ),
                            ]
                        ),),


                   ],
                  ),
                ),
              ),

              Expanded(
                child: BlocBuilder<MatchesBloc, MatchesState>(
                    builder: (context, state) {
                      if (state.matchElements.matches.length>0) {

                        return ListView.builder(
                          itemCount: state.matchElements.matches.length,
                          itemBuilder: (context, i) {
                            MatchElement matches = state.matchElements.matches[i];
                           String homeScore= matches.score.fullTime.homeTeam?.toString() ?? "0" ;
                            String awayScore= matches.score.fullTime.awayTeam?.toString() ??"0" ;

                            return InkWell(
                              key: const Key("lists"),
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (builder) => Scorecard(matches:matches)));
                              },
                              child: Container(
                                height: 110,
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF6E62FF).withOpacity(0.8),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(24),
                                  ),
                                ),
                                child:Column( children: [

                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(

                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 3,
                                              vertical: 1,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              border: Border.all(color: Colors.red),
                                              borderRadius: const BorderRadius.all(
                                                Radius.circular(3),
                                              ),
                                            ),
                                            child:Text(
                                             "Home",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                        ),
                                ]
                                          ),
                                        ),

                                        Expanded(child:Column(
                                          children: [

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
                                            DateFormat("hh:mm").format((matches.utcDate)),
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                        ),
                            ]
                                        ),
                                        ),
                                        Expanded(child:Column(
                                          children: [
                                        Text(
                                          DateFormat("dd-MM-yyyy").format((matches.utcDate)),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.lightGreenAccent,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15,
                                          ),
                                        ),
                                        ]
                                        )
                                        ),

                                      ]

                                  ),
                                  SizedBox(
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
                                      child:Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          border: Border.all(color: Colors.green),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              homeScore +" - "+ awayScore,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      ]
                                        )
                                    ),
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
                                ),]),
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
