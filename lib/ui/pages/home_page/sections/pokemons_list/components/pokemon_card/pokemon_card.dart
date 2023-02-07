import 'package:flutter/material.dart';
import 'package:pokedex_pokeapi/data/controllers/pokemon_data_controller.dart';
import 'package:pokedex_pokeapi/data/models/pokemon/pokemon_resume_data_model.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemons_list/components/pokemon_card/pokemon_card_number_shape.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemons_list/components/pokemon_card/pokemon_card_shape.dart';
import 'package:provider/provider.dart';

class PokemonCard extends StatefulWidget {
  final PokemonResumeDataModel pokemon;
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  //
  late Color cardColor;

  //
  @override
  void initState() {
    //getCardColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<PokemonDataController>(context, listen: false)
        ..setRequiredPokemon(newPokemon: widget.pokemon),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            CustomPaint(
              painter: PokemonCardShape(fillColor: Colors.white),
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      widget.pokemon.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        right: 64,
                        bottom: 16,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          widget.pokemon.name,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: CustomPaint(
                painter: PokemonCardNumberShape(fillColor: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "# ${widget.pokemon.id.padLeft(3, "0")}",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
