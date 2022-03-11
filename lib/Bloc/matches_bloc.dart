import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bttask/Api/api_manager.dart';
import 'package:bttask/Model/match.dart';
import 'package:equatable/equatable.dart';

part 'matches_event.dart';
part 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  MatchesBloc(MatchesState initialState) : super(initialState);
  //MatchesState get initialState => MatchesState(matchElements: []);

  Stream<MatchesState> mapEventToState(MatchesEvent event,)async*{
    if(event is Fetch){
      var matches = await API_Manger().getMatch();
      yield MatchesState(matchElements:matches);

    }
  }

}
