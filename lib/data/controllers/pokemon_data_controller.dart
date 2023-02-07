import 'package:flutter/material.dart';
import 'package:pokedex_pokeapi/data/api/poke_api.dart';
import 'package:pokedex_pokeapi/data/models/pokemon/pokemon_data_model.dart';
import 'package:pokedex_pokeapi/data/models/pokemon/pokemon_resume_data_model.dart';

class PokemonDataController with ChangeNotifier {
  //Variable para comunicar que no hay data
  bool hasData = false;

  //Variable para comunicar que no se ha seleccionado pokemon
  bool isSelectedPokemon = false;

  //El pokemon seleccionado
  PokemonResumeDataModel pokemonResumeDataModel = PokemonResumeDataModel(
    id: "",
    imageUrl: "",
    name: "",
    url: "",
  );

  //Variable que va a almacenar la data
  PokemonDataModel _pokemonData = PokemonDataModel(
    types: [],
    habitat: "",
    growthRate: "",
    captureRate: 0,
    baseHappiness: 0,
    description: "",
    pokemonMoves: [],
  );

  //Get para obtener la data
  PokemonDataModel get pokemonData {
    return _pokemonData;
  }

  //Instancia de la Api
  final pokemonApi = PokeApi();

  //
  void setRequiredPokemon({
    required PokemonResumeDataModel newPokemon,
  }) {
    //
    pokemonResumeDataModel = newPokemon;

    //
    isSelectedPokemon = true;

    //
    hasData = false;

    //
    notifyListeners();

    //
    getPokemonData(pokemonId: pokemonResumeDataModel.id);
  }

  //Obtener todos los pokemons
  Future<void> getPokemonData({
    required String pokemonId,
  }) async {
    //
    final PokemonDataModel obtainedPokemonData =
        await pokemonApi.getPokemonDataById(pokemonId);
    //
    _pokemonData = obtainedPokemonData;

    //
    hasData = true;
    //Se actualizan los listeners
    notifyListeners();
  }
}
