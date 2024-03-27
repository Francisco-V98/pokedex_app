import 'package:flutter/material.dart';
import 'package:pokedex_app/intrastrucuture/models/pokemon_about_model.dart';
import 'package:pokedex_app/intrastrucuture/models/pokemon_stats_model.dart';

class PokemonBasicModel {
  final String name;
  final String url;
  String id;
  String imageUrl;
  Color? cardColor;
  PokemonAboutModel? pokemonAboutModel;
  PokemonStatsModel? pokemonStatsModel;

  PokemonBasicModel({
    required this.name,
    required this.url,
    this.id = '000',
    this.imageUrl = '',
    this.cardColor = Colors.grey,
    this.pokemonStatsModel,
    this.pokemonAboutModel,
  });
}
