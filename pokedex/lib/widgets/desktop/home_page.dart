import 'package:flutter/material.dart';

import '../../models/pokemon.dart';
import '../list/list_mobile.dart';
import '../list/list_tablet.dart';
import '../list/list_desktop.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({
    Key? key,
    required this.futurePokemons,
  }) : super(key: key);

  final Future<List<Pokemon>> futurePokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex Desktop'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
