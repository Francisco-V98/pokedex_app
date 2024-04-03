import 'package:flutter/material.dart';
import 'package:pokedex_app/intrastrucuture/models/pokemon_stats_model.dart';
import 'package:pokedex_app/intrastrucuture/services/pokemon_basic_service.dart';

class PokemonDetailsProvider extends ChangeNotifier {
  final PokemonBasicService _pokemonService = PokemonBasicService();

  PokemonStatsModel? _pokemonStats;

  PokemonStatsModel? get pokemonStats => _pokemonStats;

  Future<void> fetchPokemonDetails(String namePokemon) async {
    try {
      _pokemonStats = await _pokemonService.getPokemonDetails(namePokemon);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch Pokemon details: $e');
    }
  }
}
