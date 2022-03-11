part of 'matches_bloc.dart';

abstract class MatchesEvent extends Equatable {
  const MatchesEvent();
}

class Fetch extends MatchesEvent {
  final String dateType;

  const Fetch(this.dateType);

  @override
  List<Object?> get props => [dateType];
}
