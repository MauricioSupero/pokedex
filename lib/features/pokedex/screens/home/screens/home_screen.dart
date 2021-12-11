import 'package:flutter/material.dart';
import 'package:pokedemon/commons/models/pokemon_model.dart';
import 'package:pokedemon/features/pokedex/screens/details/container/detail_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.list, required this.onItemTap})
      : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index].name),
            onTap: () =>
                onItemTap('/details', DetailArguments(name: list[index].name)),
          );
        },
      ),
    );
  }
}
