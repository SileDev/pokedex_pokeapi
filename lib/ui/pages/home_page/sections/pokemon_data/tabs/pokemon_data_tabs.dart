import 'package:flutter/material.dart';
import 'package:pokedex_pokeapi/data/controllers/pokemon_data_controller.dart';
import 'package:pokedex_pokeapi/data/models/pokemon/pokemon_data_model.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemon_data/tabs/about/pokemon_data_about.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemon_data/tabs/moves/pokemon_data_moves.dart';
import 'package:provider/provider.dart';

class PokemonDataTabs extends StatefulWidget {
  const PokemonDataTabs({
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonDataTabs> createState() => _PokemonDataTabsState();
}

class _PokemonDataTabsState extends State<PokemonDataTabs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonDataController>(
      builder: (context, pokemonDataProvider, child) {
        PokemonDataModel pokemon = pokemonDataProvider.pokemonData;
        if (pokemonDataProvider.hasData) {
          return DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: "About",
                    ),
                    Tab(
                      text: "Moves",
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      PokemonDataAbout(
                        pokemon: pokemon,
                      ),
                      PokemonDataMoves(
                        pokemon: pokemon,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          if (pokemonDataProvider.isSelectedPokemon) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        }
      },
    );
  }
}
