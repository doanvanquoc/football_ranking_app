import 'package:bloc/bloc.dart';
import 'package:football_app/models/team.dart';
import 'package:football_app/services.dart/api_service.dart';

part 'league_event.dart';
part 'league_state.dart';

class LeagueBloc extends Bloc<LeagueEvent, LeagueState> {
  final service = ApiService();
  LeagueBloc() : super(LeagueInitial()) {
    on<LeagueEvent>((event, emit) async {
      if (event is LoadTeamsEvent) {
        try {
          emit(LoadingTeamsState());
          List<Team> teams = await service.getTeams(event.leagueId);
          emit(LoadTeamsSuccessState(teams: teams));
        } catch (e) {
          // rethrow;
          emit(LoadTeamsFailState());
        }
      }
    });
  }
}
