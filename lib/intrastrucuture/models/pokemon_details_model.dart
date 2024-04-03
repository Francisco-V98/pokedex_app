import 'package:pokedex_app/intrastrucuture/models/pokemon_stats_model.dart';

class PokemonDetailsModel {
  PokemonStatsModel stats;

  PokemonDetailsModel({
    required this.stats,
  });

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsModel(
      stats: PokemonStatsModel.fromJson(json['stats']),
    );
  }
}
