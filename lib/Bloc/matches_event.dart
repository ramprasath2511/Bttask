part of 'matches_bloc.dart';

abstract class MatchesEvent extends Equatable {
  const MatchesEvent();
}
class Fetch extends MatchesEvent{
  final String dateType;

  Fetch(this.dateType);
  @override
  // TODO: implement props
  List<Object?> get props => [dateType];


}