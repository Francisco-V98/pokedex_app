class PokemonStatsModel {
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  PokemonStatsModel({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  factory PokemonStatsModel.fromJson(Map<String, dynamic> json) {
    const String name = 'stats';
    const String value = 'base_stat';
    
    return PokemonStatsModel(
      hp: json[name][0][value],
      attack: json[name][1][value],
      defense: json[name][2][value],
      specialAttack: json[name][3][value],
      specialDefense: json[name][4][value],
      speed: json[name][5][value],
    );
  }
}
