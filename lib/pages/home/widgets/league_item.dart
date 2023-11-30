import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/models/league.dart';
import 'package:football_app/pages/league/bloc/league_bloc.dart';
import 'package:football_app/pages/league/league_page.dart';

class LeagueItem extends StatelessWidget {
  const LeagueItem({super.key, required this.league});
  final League league;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LeaguePage(league: league)));
        BlocProvider.of<LeagueBloc>(context)
            .add(LoadTeamsEvent(leagueId: league.id));
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Image.network(league.lightLogo, fit: BoxFit.cover),
      title: Text(
        league.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
