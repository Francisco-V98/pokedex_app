import 'package:dio/dio.dart';

import '../models/pokemon_basic_model.dart';

class PokemonBasicService {
  List<PokemonBasicModel> pokemons = [];

  Future getAllPokemons() async {
    const url = 'https://pokeapi.co/api/v2/pokemon?limit=50';
    var dio = Dio();

    try {
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        List fetchedData = response.data['Result'];

        for (var pokemon in fetchedData) {
          final pokemonName = pokemon['name'];

          pokemons.add(
            PokemonBasicModel(
              name: pokemonName,
              url: pokemon['url'],
            ),
          );
        }
      }
      return pokemons;
    } catch (e) {
      rethrow;
    }
  }
}

Future<Map<String, dynamic>> getPokemonByName(String name) async {
  Map<String, dynamic> pokemon = {};
  var dio = Dio();
  final nameLowerCase = name.toLowerCase();

  try {
    var url = 'https://pokeapi.co/api/v2/pokemon/$nameLowerCase';
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final pokemonData = response.data['Result'];

      String pokemonIdPadLeft = '';
      int id = pokemonData['id'];
      pokemonIdPadLeft = (id).toString().padLeft(3, '0');
      String imageUrl =
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/$pokemonIdPadLeft.png';
      final pokemonUrl = 'https://pokeapi.co/api/v2/$nameLowerCase';
      pokemon = {
        'name': name,
        'id': pokemonIdPadLeft,
        'url': pokemonUrl,
        'imageUrl': imageUrl,
      };
    }
    return pokemon;
  } catch (e) {
    rethrow;
  }
}
