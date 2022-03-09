import 'dart:async';

import 'package:bttask/Api/api_manager.dart';
import 'package:bttask/Model/match.dart';
enum Operations{
  fetch,
  delete
}
class MatchBloc{
  final stateController = StreamController<List<MatchElement>>();

  StreamSink<List<MatchElement>> get counterSink => stateController.sink;
  Stream<List<MatchElement>> get counterStream => stateController.stream;

  final eventController = StreamController<Operations>();

  StreamSink<Operations> get eventSink => eventController.sink;
  Stream<Operations> get eventStream => eventController.stream;

  MatchBloc(){
    eventStream.listen((event) async{
      if(event==Operations.fetch){
try {
  print("find some one 1");
  var matches = await API_Manger().getMatch();
  print("find some one 2");
  counterSink.add(matches.matches);
  print("find some one 33");
}on Exception catch (e){
  counterSink.addError("Something Went Wrong");
}

      }
    });
  }
}