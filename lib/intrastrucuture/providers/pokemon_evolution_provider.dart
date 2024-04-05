import 'package:flutter/material.dart';
import 'package:pokedex_app/intrastrucuture/models/pokemon_evolution_model.dart';
import 'package:pokedex_app/intrastrucuture/services/pokemon_service.dart';

class PokemonEvolutionProvider extends ChangeNotifier {
  final PokemonBasicService _pokemonService = PokemonBasicService();
  late PokemonEvolutionModel? _pokemonEvolution;

  PokemonEvolutionProvider() {
    _pokemonEvolution = PokemonEvolutionModel(evolutions: []);
  }

  PokemonEvolutionModel? get pokemonEvolution => _pokemonEvolution;

  Future<void> fetchPokemonEvolution(String idEvolution) async {
    try {
      _pokemonEvolution =
          await _pokemonService.getPokemonEvolution(idEvolution);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch Pokemon evolution: $e');
    }
  }

  void resetEvolution() {
    _pokemonEvolution = null;
    notifyListeners();
  }
}
