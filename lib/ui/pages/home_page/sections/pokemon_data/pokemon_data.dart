import 'package:flutter/material.dart';
import 'package:pokedex_pokeapi/data/controllers/pokemon_data_controller.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemon_data/components/pokemon_data_header.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemon_data/pokemon_data_sheet_shape.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemon_data/pokemon_data_template_shape.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemon_data/tabs/pokemon_data_tabs.dart';
import 'package:provider/provider.dart';

class PokemonData extends StatelessWidget {
  final bool isFixed;
  const PokemonData({super.key, required this.isFixed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: double.infinity,
      child: CustomPaint(
        painter: PokemonDataTemplateShape(fillColor: Colors.white),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 232 / 2,
              ),
              child: Expanded(
                child: CustomPaint(
                  painter: PokemonDataSheetShape(
                      fillColor: Colors.black, fixed: isFixed),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 232 / 2 + 27 + 8,
                      right: 8,
                      left: 24,
                    ),
                    child: PokemonDataTabs(),
                  ),
                ),
              ),
            ),
            Consumer<PokemonDataController>(
                builder: (context, pokemonDataProvider, child) {
              if (pokemonDataProvider.isSelectedPokemon) {
                return PokemonDataHeader(
                  pokemon: pokemonDataProvider.pokemonResumeDataModel,
                );
              } else {
                return Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 16,
                  ),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Choose a Pokémon",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
