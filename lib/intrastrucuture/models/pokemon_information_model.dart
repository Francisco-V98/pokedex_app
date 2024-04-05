class PokemonInformationModel {
  final int? baseHappiness;
  final String? name;
  final int? id;
  final int? captureRate;
  final String? habitat;
  final String? flavorText;
  final String? growthRate;
  final String? evolutionChain;
  final String? evolutionId;

  PokemonInformationModel({
    this.name,
    this.id,
    this.baseHappiness,
    this.captureRate,
    this.habitat,
    this.flavorText,
    this.growthRate,
    this.evolutionChain,
    this.evolutionId,
  });

  factory PokemonInformationModel.fromJson(Map<String, dynamic> json) {
    final String urlEvolution = json['evolution_chain']['url'];
    final String evolutionId = urlEvolution.split('/').reversed.skip(1).first;
    return PokemonInformationModel(
      baseHappiness: json['base_happiness'],
      name: json['name'],
      id: json['id'],
      captureRate: json['capture_rate'],
      habitat: json['habitat']['name'],
      flavorText: json['flavor_text_entries'][0]['flavor_text'],
      growthRate: json['growth_rate']['name'],
      evolutionChain: json['evolution_chain']['url'],
      evolutionId: evolutionId,
    );
  }
}
