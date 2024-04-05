class PokemonEvolutionModel {
  final List<Evolution> evolutions;

  PokemonEvolutionModel({required this.evolutions});

  factory PokemonEvolutionModel.fromJson(Map<String, dynamic> json) {
    final List<Evolution> evolutions = _parseEvolutions(json['chain']);
    return PokemonEvolutionModel(evolutions: evolutions);
  }

  static List<Evolution> _parseEvolutions(Map<String, dynamic> chain) {
    final List<Evolution> evolutions = [];
    evolutions.addAll(_parseSpecies([chain['species']]));

    final List<dynamic> evolvesTo = chain['evolves_to'];
    for (final evolution in evolvesTo) {
      evolutions.addAll(_parseSpecies([evolution['species']]));
      if (evolution['evolves_to'] != null &&
          evolution['evolves_to'].isNotEmpty) {
        evolutions.addAll(_parseEvolutions(evolution));
      }
    }

    return evolutions;
  }

  static List<Evolution> _parseSpecies(List<dynamic> species) {
    return species.map<Evolution>((json) {
      return Evolution.fromJson(json);
    }).toList();
  }
}

// class PokemonEvolutionModel {
//   final List<Evolution> evolutions;

//   PokemonEvolutionModel({required this.evolutions});

//   factory PokemonEvolutionModel.fromJson(Map<String, dynamic> json) {
//     final List<dynamic> evolutionList = json['chain']['species'];
//     List<Evolution> evolutions =
//         evolutionList.map((e) => Evolution.fromJson(e['species'])).toList();
//     return PokemonEvolutionModel(evolutions: evolutions);
//   }
// }

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
        // 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$idPokemon.png';
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/$idPokemon.gif';
    return Evolution(
        name: json['name'],
        url: json['url'],
        id: idPokemon,
        imgPokemon: imgPokemon);
  }
}
