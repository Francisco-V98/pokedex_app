class PokemonAboutModel {
  int? baseHappiness;
  int? captureRate;
  String? flavorText;
  String? habitat;
  String? growthRate;
  List<String>? eggGroups;

  PokemonAboutModel({
    required this.baseHappiness,
    required this.captureRate,
    required this.eggGroups,
    required this.flavorText,
    required this.habitat,
    required this.growthRate,
  });
}