import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/pages/home/bloc/home_bloc.dart';
import 'package:football_app/pages/home/widgets/league_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Danh sách giải đấu'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is LoadingLeaguesState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadLeaguesSuccessState) {
            return ListView.separated(
              itemCount: state.leagues.length,
              itemBuilder: (_, index) {
                return LeagueItem(league: state.leagues[index]);
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
          return const Center(
            child: Text('Error....'),
          );
        },
      ),
    );
  }
}
