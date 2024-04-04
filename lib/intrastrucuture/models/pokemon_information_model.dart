class PokemonInformationModel {
  final int? baseHappiness;
  final String? name;
  final int? id;
  final int? captureRate;
  final String? habitat;
  final String? flavorText;
  final String? growthRate;
  final String? evolutionChain;

  PokemonInformationModel({
    this.name,
    this.id,
    this.baseHappiness,
    this.captureRate,
    this.habitat,
    this.flavorText,
    this.growthRate,
    this.evolutionChain,
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
      evolutionChain: json['evolution_chain']['url'],
    );
  }

  String evolutionId() {
    if (evolutionChain != null && evolutionChain!.isNotEmpty) {
      String urlWithoutTrailingSlash = evolutionChain!.endsWith('/')
          ? evolutionChain!.substring(0, evolutionChain!.length - 1)
          : evolutionChain!;
      return urlWithoutTrailingSlash.split('/').last;
    }
    return '';
  }
}
