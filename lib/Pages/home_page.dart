import 'package:bttask/Api/api_manager.dart';
import 'package:bttask/Bloc/match_bloc.dart';
import 'package:bttask/Model/match.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:convert';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'detailed_page.dart';


class MatchList extends StatefulWidget {
  const MatchList({Key? key}) : super(key: key);

  @override
  _MatchListState createState() => _MatchListState();

}

class _MatchListState extends State<MatchList> {

/*
 RefreshController refreshController = RefreshController(initialRefresh: false);
*/
final bloc = MatchBloc();
/*
void _onRefresh() async{
  // monitor network fetch
  await Future.delayed(Duration(milliseconds: 1000));
  // if failed,use refreshFailed()
  refreshController.refreshCompleted();
}
void _onLoading() async{
  // monitor network fetch
  await Future.delayed(Duration(milliseconds: 1000));
  // if failed,use loadFailed(),if no data return,use LoadNodata()
  API_Manger().getMatch();
  if(mounted)
    setState(() {

    });
  refreshController.loadComplete();
}*/
  @override
  void initState(){
  //refreshController = RefreshController();
  bloc.eventSink.add(Operations.fetch);
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: /*SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        // controller: refreshController,
        // onRefresh: _onRefresh,
        // onLoading: _onLoading,
        child:*/Container(
      color: Colors.lightGreen,
        child:StreamBuilder<List<MatchElement>>(
                  stream: bloc.counterStream,
                  builder: (context, snapshot) {


             if(snapshot.hasData){
        return ListView.builder(
            itemCount: snapshot.data?.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(5),
            itemBuilder: (context, i) {
              MatchElement matches = snapshot.data![i] as MatchElement;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                        builder: (builder) => Scorecard(matches:matches)));

                  },
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
                                child: Text(matches.homeTeam.name,
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
                            children: <Widget>[
                              FittedBox(
                                  child: Text(matches.score.fullTime.homeTeam.toString()),
                                  fit: BoxFit.fitWidth),
                              FittedBox(
                                  child: Text("23-12-2021"),
                                  fit: BoxFit.fitWidth),
                            ],
                          ))

                    ],
                  ),
                ),
                )
              );
            }
        );
      }else {
               return const Center(child: CircularProgressIndicator());
             }
                  }

                   ),
            //}
         // },
       ),

    );
  }

}



TextStyle teamStyle =
TextStyle(color: Colors.black, fontSize: 20, fontStyle: FontStyle.italic);
