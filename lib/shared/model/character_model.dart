class CharacterModel {
  late int id;
  final String name;
  final String race;
  final String url;
  final String description;
  final int strength;

  CharacterModel(
      {this.id = 0,
      required this.name,
      required this.race,
      required this.url,
      required this.strength,
      required this.description});

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      race: map['race'],
      url: map['urlImage'],
      strength: map['strength'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'race': race,
      'urlImage': url,
      'strength': strength,
      'description': description,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'race': race,
      'urlImage': url,
      'strength': strength,
      'description': description,
    };
  }
}
