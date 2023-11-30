// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingLeaguesState extends HomeState {}

class LoadLeaguesSuccessState extends HomeState {
  List<League> leagues;
  LoadLeaguesSuccessState({
    required this.leagues,
  });
}

class LoadLeaguesFailState extends HomeState {}
