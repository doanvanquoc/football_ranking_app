class Stat {
  final String name;
  final String displayName;
  final String displayValue;

  Stat(this.name, this.displayName, this.displayValue);

  Stat.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        displayName = json['displayName'],
        displayValue = json['displayValue'];
}
