import 'package:flutter/material.dart';
import 'package:football_app/models/team.dart';

class TeamItem extends StatelessWidget {
  const TeamItem({Key? key, required this.teams}) : super(key: key);

  final List<Team> teams;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Rank')),
              DataColumn(label: Text('Team')),
              DataColumn(label: Text('Matches')),
              DataColumn(label: Text('Wins')),
              DataColumn(label: Text('Looses')),
              DataColumn(label: Text('Draws')),
              DataColumn(label: Text('Goals')),
              DataColumn(label: Text('GA')),
              DataColumn(label: Text('GD')),
              DataColumn(label: Text('Points')),
            ],
            rows: List<DataRow>.generate(teams.length, (index) {
              final points = teams[index]
                  .stats
                  .singleWhere((element) => element.name == 'points');
              final matches = teams[index]
                  .stats
                  .singleWhere((element) => element.name == 'gamesPlayed');
              final wins = teams[index]
                  .stats
                  .singleWhere((element) => element.name == 'wins');

              final looses = teams[index]
                  .stats
                  .singleWhere((element) => element.name == 'losses');
              final draws = teams[index]
                  .stats
                  .singleWhere((element) => element.name == 'ties');
              final goals = teams[index]
                  .stats
                  .singleWhere((element) => element.name == 'pointsFor');

              final goalsAgainst = teams[index]
                  .stats
                  .singleWhere((element) => element.name == 'pointsAgainst');

              final goalDiffrence = teams[index].stats.singleWhere(
                  (element) => element.name == 'pointDifferential');
              return DataRow(
                cells: [
                  DataCell(Text('${index + 1}')),
                  DataCell(Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(teams[index].img,
                          fit: BoxFit.cover, width: 50),
                      const SizedBox(width: 10),
                      Text(teams[index].name),
                    ],
                  )),
                  DataCell(Text(matches.displayValue)),
                  DataCell(Text(wins.displayValue)),
                  DataCell(Text(looses.displayValue)),
                  DataCell(Text(draws.displayValue)),
                  DataCell(Text(goals.displayValue)),
                  DataCell(Text(goalsAgainst.displayValue)),
                  DataCell(Text(goalDiffrence.displayValue)),
                  DataCell(Text(points.displayValue)),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
