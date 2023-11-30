class CharacterModel {
  int id;
  String name;
  String image;
  String status;
  String species;

  CharacterModel({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
  });
  factory CharacterModel.fromMap(Map<String, dynamic> map) => CharacterModel(
        id: map['id'],
        name: map['name'],
        image: map['image'],
        status: map['status'],
        species: map['species'],
      );

  @override
  String toString() {
    return 'CharacterModel{id: $id, name: $name, image: $image, status: $status, species: $species}';
  }
}
