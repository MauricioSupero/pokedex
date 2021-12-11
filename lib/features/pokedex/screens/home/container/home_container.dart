import 'package:flutter/cupertino.dart';
import 'package:pokedemon/commons/error/failure.dart';
import 'package:pokedemon/commons/models/pokemon_model.dart';
import 'package:pokedemon/commons/repositories/pokemon_repository.dart';
import 'package:pokedemon/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedemon/features/pokedex/screens/home/screens/home_error.dart';
import 'package:pokedemon/features/pokedex/screens/home/screens/home_loading.dart';
import 'package:pokedemon/features/pokedex/screens/home/screens/home_screen.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {Key? key, required this.repository, required this.onItemTap})
      : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const HomeLoading();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomeScreen(
              list: snapshot.data!,
              onItemTap: onItemTap,
            );
          }
          if (snapshot.hasError) {
            return HomeError(
              error: (snapshot.error as Failure).message!,
            );
          }
          return Container();
        });
  }
}
