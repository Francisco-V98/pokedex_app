class PokemonBasicModel {
  final String name;

  PokemonBasicModel({
    required this.name,
  });

  factory PokemonBasicModel.fromJson(Map<String, dynamic> json) {
    return PokemonBasicModel(
      name: json['name'],
    );
  }
}