import 'package:flutter/foundation.dart';

import '../data/pet_repository.dart';
import '../domain/pet.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required PetRepository repository}) : _repository = repository {
    loadPets();
  }

  final PetRepository _repository;

  List<Pet> _pets = const [];
  bool _isLoading = true;
  Object? _error;

  List<Pet> get pets => List.unmodifiable(_pets);
  bool get isLoading => _isLoading;
  Object? get error => _error;

  Future<void> loadPets() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _pets = await _repository.fetchPets();
    } catch (error) {
      _error = error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite(String petId) {
    _pets = [
      for (final pet in _pets)
        if (pet.id == petId) pet.copyWith(isFavorite: !pet.isFavorite) else pet,
    ];
    notifyListeners();
  }
}