// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'league_bloc.dart';

abstract class LeagueState {}

class LeagueInitial extends LeagueState {}

class LoadingTeamsState extends LeagueState {}

class LoadTeamsSuccessState extends LeagueState {
  List<Team> teams;
  LoadTeamsSuccessState({
    required this.teams,
  });
}

class LoadTeamsFailState extends LeagueState {}
