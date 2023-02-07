import 'package:flutter/material.dart';
import 'package:pokedex_pokeapi/data/models/pokemon/pokemon_data_model.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemon_data/components/pokemon_data_section.dart';

class PokemonDataMoves extends StatelessWidget {
  final PokemonDataModel pokemon;
  const PokemonDataMoves({
    super.key, required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      physics: const BouncingScrollPhysics(),
      children: [
        PokemonDataSection(
          sectionName: "moves",
          sectionContent: Padding(
            padding: const EdgeInsets.all(8),
            child: Wrap(
              runSpacing: 8,
              spacing: 8,
              children: List.generate(
                pokemon.pokemonMoves.length,
                (index) => Chip(
                  backgroundColor: Colors.white,
                  label: Text(
                    pokemon.pokemonMoves[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
