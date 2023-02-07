import 'package:flutter/material.dart';
import 'package:pokedex_pokeapi/data/controllers/pokemon_list_controller.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemons_list/components/pokemon_card/pokemon_card.dart';
import 'package:provider/provider.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({super.key});

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  //
  int offset = 0;

  //
  bool isGettingMorePokemons = false;

  //
  final ScrollController scrollController = ScrollController();

  //
  lazyLoadPokemons() async {
    await Provider.of<PokemonListController>(context, listen: false)
        .getPokemonsFromGeneralList(offset);
    //
    setState(() {
      isGettingMorePokemons = false;
    });
  }

  @override
  void initState() {
    //
    lazyLoadPokemons();
    //
    super.initState();
  }

  //
  @override
  void dispose() {
    //
    scrollController.dispose();

    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: Consumer<PokemonListController>(
        builder: (context, pokemonsProvider, child) {
          return CustomScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 8,
                  right: 8,
                  bottom: 8,
                  left: 8,
                ),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: pokemonsProvider.pokemons.length,
                    (context, index) {
                      return PokemonCard(
                        pokemon: pokemonsProvider.pokemons[index],
                      );
                    },
                  ),
                  gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 320 * 2,
                    mainAxisExtent: 132,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: isGettingMorePokemons
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Center(
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  //bug a corregir
                                  "Avanza para cargar más",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Icon(
                                    Icons.arrow_circle_down_rounded,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ],
          );
        },
      ),
      onNotification: (notification) {
        if (notification is ScrollNotification) {
          if (scrollController.position.atEdge) {
            bool isTop = scrollController.position.pixels == 0;
            //
            if (!isTop && !isGettingMorePokemons) {
              setState(() {
                isGettingMorePokemons = true;
              });
              offset += 20;
              lazyLoadPokemons();
            }
          }
        }
        return false;
      },
    );
  }
}
