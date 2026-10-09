import '../domain/pet.dart';

class PetRepository {
  Future<List<Pet>> fetchPets() async {
    return const [
      Pet(
        id: 'luna',
        name: 'Luna',
        species: 'Dog',
        nextAppointment: 'Annual check-up · Tomorrow',
        isFavorite: true,
      ),
      Pet(
        id: 'milo',
        name: 'Milo',
        species: 'Cat',
        nextAppointment: 'Grooming · Friday',
      ),
    ];
  }
}