import 'package:flutter/material.dart';
import 'package:pokedex_pokeapi/data/models/pokemon/pokemon_data_model.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemon_data/components/pokemon_data_section.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemon_data/tabs/about/components/data_label.dart/data_label.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemon_data/tabs/about/components/description_card/description_card.dart';

class PokemonDataAbout extends StatelessWidget {
  final PokemonDataModel pokemon;
  const PokemonDataAbout({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      physics: const BouncingScrollPhysics(),
      children: [
        PokemonDataSection(
          sectionName: "types",
          sectionContent: Padding(
            padding: const EdgeInsets.all(8),
            child: Wrap(
              runSpacing: 8,
              spacing: 8,
              children: List.generate(
                pokemon.types.length,
                (index) => Chip(
                  backgroundColor: Colors.white,
                  label: Text(
                    pokemon.types[index],
                  ),
                ),
              ),
            ),
          ),
        ),
        PokemonDataSection(
          sectionName: "info",
          sectionContent: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DataLabel(label: "habitat", value: pokemon.habitat),
                DataLabel(label: "growth rate", value: pokemon.growthRate),
                DataLabel(
                    label: "capture rate", value: "${pokemon.captureRate} %"),
                DataLabel(
                    label: "base happiness",
                    value: "${pokemon.baseHappiness} points"),
              ],
            ),
          ),
        ),
        PokemonDataSection(
          sectionName: "description",
          sectionContent: Column(children: [
            DescriptionCard(
              //index: index,
              text: pokemon.description,
            ),
          ]
              // List.generate(
              //   pokemon.descriptions.length,
              //   (index) => DescriptionCard(
              //     index: index,
              //     text: pokemon.descriptions[index],
              //   ),
              // ),
              ),
        ),
      ],
    );
  }
}
