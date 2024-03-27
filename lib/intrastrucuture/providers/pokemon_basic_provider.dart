import 'package:flutter/material.dart';
import 'package:pokedex_app/intrastrucuture/models/pokemon_basic_model.dart';
import 'package:pokedex_app/intrastrucuture/services/pokemon_basic_service.dart';

class PokemonBasicProvider with ChangeNotifier {
  final List<PokemonBasicModel> _pokemons = [];

  List<PokemonBasicModel> get pokemons {
    return [..._pokemons];
  }

  final basicService = PokemonBasicService();

  Future<void> getAllPokemons() async {
    final fetchedPokemons = await basicService.getAllPokemons();
    for (var pokemon in fetchedPokemons) {
      _pokemons.add(pokemon);
    }
    notifyListeners();
  }
}
