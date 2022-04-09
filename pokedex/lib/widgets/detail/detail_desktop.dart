import 'package:flutter/material.dart';

import '../../utils/detail_utils.dart';

class DetailDesktop extends StatelessWidget {
  const DetailDesktop({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final Map<String, dynamic> arguments;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(left: 100, right: 100),
                child: Image.network(
                  arguments['pokemon'].image,
                  width: 200,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Id: ${arguments['pokemon'].id}',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Altura: ${arguments['pokemon'].height}',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Peso: ${arguments['pokemon'].weight}',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Abilidades',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                    children: abilitiesRows(arguments['pokemon'].abilities)),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
