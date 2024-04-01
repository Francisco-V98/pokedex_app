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
        List<dynamic> dataPokemon = response.data['results'];
        List<PokemonBasicModel> pokemons = dataPokemon
            .map((json) => PokemonBasicModel.fromJson(json))
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

//   Future getAllPokemons() async {
//     List<PokemonBasicModel> pokemons = [];

//     const url = 'https://pokeapi.co/api/v2/pokemon?limit=50';
//     var dio = Dio();

//     try {
//       Response response = await dio.get(url);

//       if (response.statusCode == 200) {
//         List fetchedData = response.data['results'];

//         for (var pokemon in fetchedData) {
//           String pokemonName = pokemon['name'];
//           String pokemonUrl = pokemon['url'];

//           pokemons.add(
//             PokemonBasicModel(
//               name: pokemonName,
//               url: pokemonUrl,
//             ),
//           );
//         }
//       }
//       return pokemons;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

// Future<Map<String, dynamic>> getPokemonByName(String name) async {
//   Map<String, dynamic> pokemon = {};
//   var dio = Dio();
//   final nameLowerCase = name.toLowerCase();

//   try {
//     var url = 'https://pokeapi.co/api/v2/pokemon/$nameLowerCase';
//     final response = await dio.get(url);

//     if (response.statusCode == 200) {
//       final pokemonData = response.data['results'];

//       String pokemonIdPadLeft = '';
//       int id = pokemonData['id'];
//       pokemonIdPadLeft = (id).toString().padLeft(3, '0');
//       String imageUrl =
//           'https://assets.pokemon.com/assets/cms2/img/pokedex/full/$pokemonIdPadLeft.png';
//       final pokemonUrl = 'https://pokeapi.co/api/v2/$nameLowerCase';
//       pokemon = {
//         'name': name,
//         'id': pokemonIdPadLeft,
//         'url': pokemonUrl,
//         'imageUrl': imageUrl,
//       };
//     }
//     return pokemon;
//   } catch (e) {
//     rethrow;
//   }
}
