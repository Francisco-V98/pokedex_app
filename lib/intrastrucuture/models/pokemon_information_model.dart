class PokemonInformationModel {
  final int? baseHappiness;
  final int? captureRate;
  final String? flavorText;
  final String? habitat;
  final String? growthRate;
  final List<String>? eggGroups;

  PokemonInformationModel({
    this.baseHappiness,
    this.captureRate,
    this.flavorText,
    this.habitat,
    this.growthRate,
    this.eggGroups,
  });

  factory PokemonInformationModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? eggGroupsJson = json['egg_groups'];

    return PokemonInformationModel(
      baseHappiness: json['base_happiness'],
      captureRate: json['capture_rate'],
      flavorText: json['flavor_text'],
      habitat: json['habitat'],
      growthRate: json['growth_rate'],
      eggGroups: eggGroupsJson != null
          ? List<String>.from(eggGroupsJson.map((group) => group['name']))
          : null,
    );
  }
}
