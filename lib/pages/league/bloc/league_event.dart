// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'league_bloc.dart';

abstract class LeagueEvent {}

class LoadTeamsEvent extends LeagueEvent {
  final String leagueId;
  LoadTeamsEvent({
    required this.leagueId,
  });
  
}
