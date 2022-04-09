import 'package:flutter/material.dart';

import '../../models/pokemon.dart';
import '../pokemon_card.dart';

class ListTablet extends StatelessWidget {
  final List<Pokemon> pokemons;

  const ListTablet(
    this.pokemons, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: pokemons.length,
      itemBuilder: (context, i) => PokemonCard(pokemons[i]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 0.7,
      ),
    );
  }
}
