import 'dart:convert';
import 'package:pokedex_pokeapi/data/models/pokemon/pokemon_data_model.dart';
import 'package:pokedex_pokeapi/data/models/pokemon/pokemon_resume_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_pokeapi/utils/text/text_utils.dart';

class PokeApi {
  //
  Future<List<PokemonResumeDataModel>> getPokemonsFromGeneralList(
      int offset) async {
    //Lista que almacenará a todos los pokemones obtenidos
    List<PokemonResumeDataModel> obtainedPokemons = [];

    //Se intenta obtener la data
    try {
      //Se valida que aún no se haya alcanzado el limite de consultas
      if (offset >= 1000) {
        //No se cargan más porque llegó al final de
        //la lista
        return obtainedPokemons;
      }

      //Se construye la Uri para la consulta
      Uri apiUrl = Uri.https('pokeapi.co', '/api/v2/pokemon',
          {'limit': '20', 'offset': offset.toString()});

      //Se ejecua la petición y se almacena en la variable
      final response = await http.get(apiUrl);

      //Lista que almacenará la data obtenida
      List<dynamic> obtainedData = [];

      //Validar codigo de respuesta
      if (response.statusCode == 200) {
        //Decodificar la data de respuesta a formato json
        obtainedData = json.decode(response.body)['results'];

        //Se recorre el listado de pokemones obtenidos
        for (var pokemon in obtainedData) {
          //Se agrega cada pokemon al listado global que se puede consultar
          final String pokemonId =
              pokemon['url'].split("/")[pokemon['url'].split("/").length - 2];
          obtainedPokemons.add(
            PokemonResumeDataModel(
              name: TextUtils().makeUpperCaseWord(text: pokemon['name']),
              url: pokemon['url'],
              id: pokemonId,
              imageUrl:
                  "https://assets.pokemon.com/assets/cms2/img/pokedex/full/${pokemonId.padLeft(3, "0")}.png",
            ),
          );
        }
      }
      //Se retorna la lista de pokemones con los nuevos datos obtenidos
      return obtainedPokemons;
    } catch (error) {
      rethrow;
    }
  }

  //
  Future<PokemonDataModel> getPokemonDataById(String id) async {
    //
    List<String> pokemonTypes = [];
    String habitat = "";
    String growthRate = "";
    int captureRate = 0;
    int baseHappiness = 0;
    String pokemonDescription = "";
    List<String> pokemonMoves = [];

    //
    try {
      //
      Uri basicDataApiUrl =
          Uri.https('pokeapi.co', '/api/v2/pokemon-species/$id');
      //
      final basicDataResponse = await http.get(basicDataApiUrl);

      //
      if (basicDataResponse.statusCode == 200) {
        //
        final obtainedPokemonBasicData = json.decode(basicDataResponse.body);

        //
        //List<String> descriptions = [];

        //
        // for (var description
        //     in obtainedPokemonBasicData["flavor_text_entries"]) {
        //   if (description["language"]["name"] == "en" &&
        //       !descriptions.contains(
        //         description["flavor_text"].replaceAll(
        //           RegExp("\n"),
        //           "",
        //         ),
        //       )) {
        //     descriptions.add(
        //       description["flavor_text"].replaceAll(RegExp("\n"), ""),
        //     );
        //   }
        // }

        //
        //pokemonDescription = description;

        pokemonDescription = obtainedPokemonBasicData["flavor_text_entries"][0]
                ["flavor_text"]
            .replaceAll(RegExp("\n"), "");

        //
        habitat = TextUtils().makeUpperCaseWord(
          text: obtainedPokemonBasicData["habitat"]["name"],
        );
        growthRate = obtainedPokemonBasicData['growth_rate']['name'];
        captureRate = obtainedPokemonBasicData['capture_rate'];

        baseHappiness = obtainedPokemonBasicData['base_happiness'];
      }

      //
      Uri specificDataApiUrl = Uri.https('pokeapi.co', '/api/v2/pokemon/$id');
      //
      final specificDataResponse = await http.get(specificDataApiUrl);

      //
      if (specificDataResponse.statusCode == 200) {
        //
        final obtainedPokemonSpecificData =
            json.decode(specificDataResponse.body);

        //
        List<String> types = [];

        //
        for (var type in obtainedPokemonSpecificData["types"]) {
          types.add(
            TextUtils().makeUpperCaseWord(
              text: type["type"]["name"],
            ),
          );
        }

        //
        pokemonTypes = types;

        //
        List<String> moves = [];

        //
        for (var move in obtainedPokemonSpecificData["moves"]) {
          moves.add(
            TextUtils().makeUpperCaseWord(
              text: move["move"]["name"],
            ),
          );
        }

        //
        pokemonMoves = moves;
      }

      //
      return PokemonDataModel(
        types: pokemonTypes,
        habitat: habitat,
        growthRate: growthRate,
        captureRate: captureRate,
        baseHappiness: baseHappiness,
        description: pokemonDescription,
        pokemonMoves: pokemonMoves,
      );
    } catch (error) {
      rethrow;
    }
  }
}
