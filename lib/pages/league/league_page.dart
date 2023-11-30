import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/models/league.dart';
import 'package:football_app/pages/league/bloc/league_bloc.dart';
import 'package:football_app/pages/league/widgets/team_item.dart';

class LeaguePage extends StatelessWidget {
  const LeaguePage({super.key, required this.league});
  final League league;

  @override
  Widget build(BuildContext context) {
    log('onbuild team');
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(league.name),
      ),
      body: BlocBuilder<LeagueBloc, LeagueState>(
        builder: (context, state) {
          if (state is LoadingTeamsState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadTeamsSuccessState) {
            return TeamItem(teams: state.teams);
          }
          return const Center(
            child: Text('Bị lỗi gì đó rồi :v'),
          );
        },
      ),
    );
  }
}
