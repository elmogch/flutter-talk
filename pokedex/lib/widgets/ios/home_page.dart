import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../models/pokemon.dart';
import '../list/list_mobile.dart';
import '../list/list_tablet.dart';
import '../list/list_desktop.dart';

class HomeIOS extends StatelessWidget {
  const HomeIOS({
    Key? key,
    required this.futurePokemons,
  }) : super(key: key);

  final Future<List<Pokemon>> futurePokemons;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Pokedex iOS'),
          backgroundColor: CupertinoColors.systemRed,
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Text(
              'Agregar',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => {},
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
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
        ));
  }
}
