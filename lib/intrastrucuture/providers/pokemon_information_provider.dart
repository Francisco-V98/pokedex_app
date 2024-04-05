import 'package:flutter/material.dart';
import 'package:pokedex_app/intrastrucuture/models/pokemon_information_model.dart';
import 'package:pokedex_app/intrastrucuture/services/pokemon_service.dart';

class PokemonInformationProvider extends ChangeNotifier {
  final PokemonBasicService _pokemonService = PokemonBasicService();

  PokemonInformationModel? _pokemonInformation;

  PokemonInformationModel? get pokemonInformation => _pokemonInformation;

  Future<void> fetchPokemonInformation(String namePokemon) async {
    try {
      _pokemonInformation =
          await _pokemonService.getPokemonInformation(namePokemon);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch Pokemon about: $e');
    }
  }

  void resetInformation() {
    _pokemonInformation = null;
    notifyListeners();
  }
}
