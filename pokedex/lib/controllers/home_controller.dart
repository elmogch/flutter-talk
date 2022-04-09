import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/pokemon.dart';
import '../widgets/list/list_mobile.dart';
import '../widgets/list/list_tablet.dart';
import '../widgets/list/list_desktop.dart';

Future<List<Pokemon>> fetchPokemonList() async {
  final pokemonListResponse =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));

  if (pokemonListResponse.statusCode == 200) {
    Map<String, dynamic> pokemonList = json.decode(pokemonListResponse.body);
    final List<Pokemon> list = [];
    for (var item in pokemonList['results']) {
      final pokemonDetailResponse = await http.get(Uri.parse(item['url']));

      if (pokemonListResponse.statusCode == 200) {
        Map<String, dynamic> pokemonDetail =
            json.decode(pokemonDetailResponse.body);

        Pokemon pokemon = Pokemon.fromJson(pokemonDetail);
        list.add(pokemon);
      } else {
        throw Exception('Failed to load album');
      }
    }
    return list;
  } else {
    throw Exception('Failed to load album');
  }
}

class HomeController extends StatefulWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  late Future<List<Pokemon>> futurePokemons;

  @override
  void initState() {
    super.initState();
    futurePokemons = fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Center(
        child: FutureBuilder<List<Pokemon>>(
          future: futurePokemons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return LayoutBuilder(
                builder: ((context, constraints) {
                  if (constraints.maxWidth < 600) {
                    return ListMobile(snapshot.data!);
                  } else if (constraints.maxWidth < 1200) {
                    return ListTablet(snapshot.data!);
                  } else {
                    return ListDesktop(snapshot.data!);
                  }
                }),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
