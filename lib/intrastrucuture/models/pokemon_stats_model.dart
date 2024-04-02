class PokemonStatsModel {
  int baseStat;
  int effort;
  PokemonStatModel stat;

  PokemonStatsModel({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory PokemonStatsModel.fromJson(Map<String, dynamic> json) {
    return PokemonStatsModel(
      baseStat: json['base_stat'],
      effort: json['effort'],
      stat: PokemonStatModel.fromJson(json['stat']),
    );
  }
}

class PokemonStatModel {
  String name;

  PokemonStatModel({
    required this.name,
  });

  factory PokemonStatModel.fromJson(Map<String, dynamic> json) {
    return PokemonStatModel(
      name: json['name'],
    );
  }
}