import 'package:flutter/material.dart';
import 'package:pokedemon/commons/repositories/pokemon_repository.dart';
import 'package:pokedemon/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedemon/features/pokedex/screens/home/container/home_container.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute(
      {Key? key, required this.pokemonRepository, required this.onItemTap})
      : super(key: key);
  final PokemonRepository pokemonRepository;
  final Function(String, DetailArguments) onItemTap;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repository: pokemonRepository,
                onItemTap: (route, arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              );
            },
          );
        }
        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailContainer(
                repository: pokemonRepository,
                arguments: settings.arguments as DetailArguments,
              );
            },
          );
        }
      },
    );
  }
}
