class PokemonInformationModel {
  final int? baseHappiness;
  final String? name;
  final int? id;
  final int? captureRate;
  final String? habitat;
  final String? flavorText;
  final String? growthRate;
  // final List<String>? eggGroups;

  PokemonInformationModel({
    this.name,
    this.id,
    this.baseHappiness,
    this.captureRate,
    this.habitat,
    this.flavorText,
    this.growthRate,
  });

  factory PokemonInformationModel.fromJson(Map<String, dynamic> json) {

    return PokemonInformationModel(
      baseHappiness: json['base_happiness'],
      name: json['name'],
      id: json['id'],
      captureRate: json['capture_rate'],
      habitat: json['habitat']['name'],
      flavorText: json['flavor_text_entries'][0]['flavor_text'],
      growthRate: json['growth_rate']['name'],
    );
  }
}
