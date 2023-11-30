import 'package:dio/dio.dart';
import 'package:football_app/apps/app_config.dart';
import 'package:football_app/models/league.dart';
import 'package:football_app/models/team.dart';

class ApiService {
  final dio = Dio();
  Future<List<League>> getLeagues() async {
    List<League> leagues = [];
    try {
      Response res = await dio.get('${AppConfig.endPoint}/leagues');
      leagues =
          (res.data['data'] as List).map((e) => League.fromJson(e)).toList();
      return leagues;
    } catch (e) {
      return leagues;
    }
  }

  Future<List<Team>> getTeams(String leagueId) async {
    List<Team> teams = [];
    try {
      Response res = await dio.get(
          '${AppConfig.endPoint}/leagues/$leagueId/standings?season=2023&sort=asc');
      teams = (res.data['data']['standings'] as List)
          .map((e) => Team.fromJson(e))
          .toList();
      return teams;
    } catch (e) {
      rethrow;
      return teams;
    }
  }
}
