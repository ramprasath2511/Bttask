import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bttask/Api/api_manager.dart';
import 'package:bttask/Model/match.dart';
import 'package:equatable/equatable.dart';

part 'matches_event.dart';
part 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
 Game? matches;

  MatchesBloc(MatchesState initialState) : super(initialState);

  @override
  MatchesState get initialState => MatchesState(matchElements: matches!);

  Stream<MatchesState> mapEventToState(MatchesEvent event,)async*{
    if(event is Fetch){
      print("fetxh");
      print(event.dateType);
       matches = await API_Manger().getMatch(event.dateType);
      yield MatchesState(matchElements:matches!);

    }
  }

}
