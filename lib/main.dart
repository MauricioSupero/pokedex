import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedemon/commons/repositories/pokemon_repository.dart';
import 'package:pokedemon/features/pokedex/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDevil',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokedexRoute(
        pokemonRepository: PokemonRepository(dio: Dio()),
        onItemTap: (String, DetailArguments) {},
      ),
    );
  }
}
