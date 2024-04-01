class PokemonDetailModel {
  final int id;
  final String name;
  final String url;

  PokemonDetailModel({
    required this.id,
    required this.name,
    required this.url,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
    );
  }
}