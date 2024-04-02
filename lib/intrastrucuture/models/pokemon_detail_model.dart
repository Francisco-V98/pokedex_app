import 'package:pokedex_app/intrastrucuture/models/pokemon_stats_model.dart';

class PokemonDetailModel {
  PokemonStatsModel stats;

  PokemonDetailModel({
    required this.stats,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      stats: PokemonStatsModel.fromJson(json['stats']),
    );
  }
}
