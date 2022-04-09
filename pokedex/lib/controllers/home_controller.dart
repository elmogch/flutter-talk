import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/widgets/desktop/home_page.dart';
import 'package:pokedex/widgets/web/home_page.dart';

import '../models/pokemon.dart';
import '../widgets/ios/home_page.dart';
import '../widgets/android/home_page.dart';

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
    if (kIsWeb) {
      return HomeWeb(futurePokemons: futurePokemons);
    }
    if (defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows) {
      return HomeDesktop(futurePokemons: futurePokemons);
    }

    if (defaultTargetPlatform != TargetPlatform.iOS) {
      return HomeIOS(futurePokemons: futurePokemons);
    }
    return HomeAndroid(futurePokemons: futurePokemons);
  }
}
