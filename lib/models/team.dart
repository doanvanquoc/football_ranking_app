import 'package:football_app/models/stat.dart';

class Team {
  final String id;
  final String name;
  final String img;
  final List<Stat> stats;

  Team(this.id, this.name, this.img, this.stats);

  Team.fromJson(Map<String, dynamic> json)
      : id = json['team']['id'],
        name = json['team']['name'],
        img = json['team']['logos'][0]['href'],
        stats = (json['stats'] as List).map((e) => Stat.fromJson(e)).toList();
}
