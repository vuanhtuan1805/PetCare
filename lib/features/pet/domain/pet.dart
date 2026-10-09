class Pet {
  const Pet({
    required this.id,
    required this.name,
    required this.species,
    required this.nextAppointment,
    this.isFavorite = false,
  });

  final String id;
  final String name;
  final String species;
  final String nextAppointment;
  final bool isFavorite;

  Pet copyWith({bool? isFavorite}) {
    return Pet(
      id: id,
      name: name,
      species: species,
      nextAppointment: nextAppointment,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}