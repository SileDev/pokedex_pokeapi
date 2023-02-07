import 'package:flutter/material.dart';
import 'package:pokedex_pokeapi/data/models/pokemon/pokemon_resume_data_model.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemons_list/components/pokemon_card/pokemon_card_number_shape.dart';

class PokemonDataHeader extends StatelessWidget {
  final PokemonResumeDataModel pokemon;
  const PokemonDataHeader({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Text(
                pokemon.name,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                width: double.infinity,
                height: 232,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    pokemon.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 32,
            left: 32,
            child: CustomPaint(
              painter: PokemonCardNumberShape(fillColor: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "# ${pokemon.id.padLeft(3, "0")}",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
