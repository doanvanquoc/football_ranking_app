import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:football_app/models/league.dart';
import 'package:football_app/services.dart/api_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final service = ApiService();
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadLeaguesEvent) {
        try {
          emit(LoadingLeaguesState());
          List<League> leagues = await service.getLeagues();
          emit(LoadLeaguesSuccessState(leagues: leagues));
        } catch (e) {
          log(e.toString());
          emit(LoadLeaguesFailState());
        }
      }
    });
  }
}
