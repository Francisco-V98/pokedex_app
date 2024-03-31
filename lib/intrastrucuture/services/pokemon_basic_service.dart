import 'package:dio/dio.dart';

import '../models/pokemon_basic_model.dart';

class PokemonBasicService {

  Future getAllPokemons() async {
    List<PokemonBasicModel> pokemons = [];

    const url = 'https://pokeapi.co/api/v2/pokemon?limit=50';
    var dio = Dio();

    try {
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        List fetchedData = response.data['results'];

        for (var pokemon in fetchedData) {
          String pokemonName = pokemon['name'];
          String pokemonUrl = pokemon['url'];

          pokemons.add(
            PokemonBasicModel(
              name: pokemonName,
              url: pokemonUrl,
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
      final pokemonData = response.data['results'];

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
