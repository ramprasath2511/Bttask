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
  Stream<MatchesState> mapEventToState(
    MatchesEvent event,
  ) async* {
    if (event is Fetch) {
      matches = await APIManger().getMatchDetails(event.dateType);
      yield MatchesState(matchElements: matches!);
    }
  }
}
