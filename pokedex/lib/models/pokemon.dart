// import "../extensions/string_extension.dart";

class Pokemon {
  int id;
  String name;
  String image;
  int weight;
  int height;
  late List<String>? abilities;

  Pokemon(
      {required this.id,
      required this.name,
      required this.image,
      required this.weight,
      required this.height,
      this.abilities = const []});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    Pokemon pokemon = Pokemon(
      id: json['id'],
      name: json['name'] != null
          ? "${json['name'][0].toUpperCase()}${json['name'].substring(1)}"
          : '',
      image: json['sprites']['back_default'],
      weight: json['weight'],
      height: json['height'],
    );

    if (json['abilities'] != null && json['abilities'] != '') {
      pokemon.abilities = [];
      json['abilities'].forEach((ability) {
        pokemon.abilities!.add(ability['ability']['name']);
      });
    }

    return pokemon;
  }
}
