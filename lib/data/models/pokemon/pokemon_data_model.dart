class PokemonDataModel {
  //
  final List<String> types;
  final String habitat;
  final String growthRate;
  final int captureRate;
  final int baseHappiness;
  final String description;
  final List<String> pokemonMoves;

  //
  PokemonDataModel({
    required this.types,
    required this.habitat,
    required this.growthRate,
    required this.captureRate,
    required this.baseHappiness,
    required this.description,
    required this.pokemonMoves,
  });
}
