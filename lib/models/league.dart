class League {
  final String id;
  final String name;
  final String darkLogo;
  final String lightLogo;

  League({
    required this.id,
    required this.name,
    required this.darkLogo,
    required this.lightLogo,
  });

  League.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        darkLogo = json['logos']['dark'],
        lightLogo = json['logos']['light'];
}
