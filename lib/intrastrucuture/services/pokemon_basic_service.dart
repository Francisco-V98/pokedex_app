import 'package:dio/dio.dart';
import 'package:pokedex_app/intrastrucuture/models/pokemon_detail_model.dart';

import '../models/pokemon_basic_model.dart';

class PokemonBasicService {
  var dio = Dio();
  final String baseUrl = 'https://pokeapi.co/api/v2/';

  //Service to get pokemon list
  Future<List<PokemonBasicModel>> getAllPokemons() async {
    String url = '$baseUrl/pokemon?limit=50';

    try {
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        List<dynamic> pokemonData = response.data['results'];
        List<PokemonBasicModel> pokemons = pokemonData
            .map((pokemon) => PokemonBasicModel.fromJson(pokemon))
            .toList();
        return pokemons;
      } else {
        throw Exception('Failed to load pokemons: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load pokemons: $e');
    }
  }

  // Service to get pokemon details
  Future<PokemonDetailModel> getPokemonDetails(String namePokemon) async {
    final nameLowerCase = namePokemon.toLowerCase();
    try {
      String url = '$baseUrl/pokemon/$nameLowerCase';
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return PokemonDetailModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load pokemon details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load pokemon details: $e');
    }
  }
}
