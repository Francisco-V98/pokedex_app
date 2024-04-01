import 'package:flutter/material.dart';
import 'package:pokedex_app/intrastrucuture/models/pokemon_basic_model.dart';
import 'package:pokedex_app/intrastrucuture/services/pokemon_basic_service.dart';

class PokemonBasicProvider with ChangeNotifier {
  List<PokemonBasicModel> _pokemonsList = [];

  List<PokemonBasicModel> get pokemonsList => _pokemonsList;

  final basicService = PokemonBasicService();

  Future<void> getAllPokemons() async {
    try {
      _pokemonsList = await basicService.getAllPokemons();
      notifyListeners();
    } catch (e) {
      throw Exception('Error fetching pokemons: $e');
    }
  }
}
