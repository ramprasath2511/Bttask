part of 'matches_bloc.dart';

class MatchesState extends Equatable {
  final Game? matchElements;

  const MatchesState({required this.matchElements});

  @override
  List<Object?> get props => [matchElements];
}
