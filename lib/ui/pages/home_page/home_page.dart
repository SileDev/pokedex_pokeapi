import 'package:flutter/material.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/components/home_page_app_bar.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemon_data/pokemon_data.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemons_list/pokemons_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 88),
        child: HomePageAppBar(),
      ),
      body: Row(
        children: [
          const Expanded(
            child: PokemonsList(),
          ),
          if (MediaQuery.of(context).size.width - (400 + 32) > 320 * 2)
            const PokemonData(
              isFixed: true,
            )
        ],
      ),
    );
  }
}
