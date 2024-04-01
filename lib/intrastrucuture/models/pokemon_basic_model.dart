class PokemonBasicModel {
  final String name;
  final String url;

  PokemonBasicModel({
    required this.name,
    required this.url,
  });

  factory PokemonBasicModel.fromJson(Map<String, dynamic> json) {
    return PokemonBasicModel(
      name: json['name'],
      url: json['url'],
    );
  }
}