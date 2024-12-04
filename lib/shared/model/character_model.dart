class CharacterModel {
  final int id;
  final String name;
  final String race;
  final String url;
  final int strength;

  CharacterModel({
    this.id = 0,
    required this.name,
    required this.race,
    required this.url,
    required this.strength,
  });

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'],
      name: map['name'],
      race: map['race'],
      url: map['url'],
      strength: map['strength'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'race': race,
      'url': url,
      'strength': strength,
    };
  }
}
