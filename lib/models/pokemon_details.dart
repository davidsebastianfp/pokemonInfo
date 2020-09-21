import 'dart:convert';

class Details {
  int base_experience;
  int height;
  int id;
  bool is_default;
  String location_area_encounters;
  String name;
  int order;
  int weight;
  String sprite_back_default;
  List<String> types;
  List<String> moves;

  Details(
      {this.base_experience,
      this.height,
      this.id,
      this.is_default,
      this.location_area_encounters,
      this.name,
      this.order,
      this.weight,
      this.sprite_back_default,
      this.types,
      this.moves});

  factory Details.fromJson(Map<String, dynamic> str) {
    Details details = Details();
    details = Details(
      base_experience: str["base_experience"],
      height: str["height"],
      id: str["id"],
      is_default: str["is_default"],
      location_area_encounters: str["location_area_encounters"],
      name: str["name"],
      order: str["order"],
      weight: str["weight"],
      sprite_back_default: str["sprites"]["back_default"],
    );
    details.types = List<String>.generate(
        str["types"].length, (index) => str["types"][index]["type"]["name"]);

    details.moves = List<String>.generate(
        str["moves"].length, (index) => str["moves"][index]["move"]["name"]);
    return details;
  }
}
