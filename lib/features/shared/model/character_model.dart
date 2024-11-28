class CharacterModel {
  final String name;
  final String race;
  final String url;
  final int strength;

  CharacterModel({
    required this.name,
    required this.race,
    required this.url,
    required this.strength,
  });

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      name: map['name'],
      race: map['race'],
      url: map['url'],
      strength: map['strength'],
    );
  }
}
