import 'dart:io' show Platform;
import 'package:flutter/material.dart';

import '../controllers/detail_controller.dart';
import '../models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard(this.pokemon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailController.routeName, arguments: {
          'pokemon': this.pokemon,
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.network(
            this.pokemon.image,
            width: 160,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              child: Text(this.pokemon.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(195, 195, 195, 1),
                  ))),
        ],
      ),
    );
  }
}
