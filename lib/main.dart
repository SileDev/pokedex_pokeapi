import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_pokeapi/data/controllers/pokemon_data_controller.dart';
import 'package:pokedex_pokeapi/data/controllers/pokemon_list_controller.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PokemonListController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PokemonDataController(),
        ),
      ],
      child: MaterialApp(
        title: 'Pokédex - PokéApi',
        theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: const Color(0xffbfbfbf),
        ),
        routes: {
          "/Home": (context) => const HomePage(),
        },
        initialRoute: "/Home",
      ),
    );
  }
}
