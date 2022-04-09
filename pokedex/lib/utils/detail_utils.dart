import 'package:flutter/material.dart';

List<Widget> abilitiesRows(abilities) {
  final List<Widget> rows = [];
  for (int rowIndex = 0; rowIndex < abilities.length; rowIndex++) {
    rows.add(SizedBox(
      width: double.infinity,
      child: Text(
        abilities[rowIndex],
        style: TextStyle(fontSize: 20.0),
        textAlign: TextAlign.left,
      ),
    ));
  }
  return rows;
}
