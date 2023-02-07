
import 'package:flutter/material.dart';
import 'package:pokedex_pokeapi/data/api/poke_api.dart';
import 'package:pokedex_pokeapi/data/models/pokemon/pokemon_resume_data_model.dart';

class PokemonListController with ChangeNotifier {
  //Variable que va a almacenar la data
  final List<PokemonResumeDataModel> _pokemons = [];

  //Get para obtener la data
  List<PokemonResumeDataModel> get pokemons {
    return [..._pokemons];
  }

  //Instancia de la Api
  final pokemonApi = PokeApi();

  //Obtener todos los pokemons
  Future<void> getPokemonsFromGeneralList(int offset) async {
    //Se obtienen los pokemons usando la Api,
    final List<PokemonResumeDataModel> obtainedPokemons =
        await pokemonApi.getPokemonsFromGeneralList(offset);
    //Se agregan los nuevos resultados a la lista para conseguir un Lazy
    //Loading
    for (var pokemon in obtainedPokemons) {
      _pokemons.add(pokemon);
    }
    //Se actualizan los listeners
    notifyListeners();
  }
}
