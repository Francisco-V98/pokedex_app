class PokemonEvolutionModel {
  final List<Evolution> evolutions;

  PokemonEvolutionModel({required this.evolutions});

  factory PokemonEvolutionModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> chain = json['chain']['evolves_to'];
    List<Evolution> evolutions =
        chain.map((e) => Evolution.fromJson(e['species'])).toList();
    return PokemonEvolutionModel(evolutions: evolutions);
  }
}

class Evolution {
  final String name;
  final String url;
  final String id;
  final String imgPokemon;

  Evolution(
      {required this.name,
      required this.url,
      required this.id,
      required this.imgPokemon});

  factory Evolution.fromJson(Map<String, dynamic> json) {
    final String urlPokemon = json['url'];
    final idPokemon = urlPokemon.split('/').reversed.skip(1).first;
    final String imgPokemon =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$idPokemon.png';
    return Evolution(
        name: json['name'],
        url: json['url'],
        id: idPokemon,
        imgPokemon: imgPokemon);
  }
}
