import 'package:flutter/material.dart';

import 'features/pet/data/pet_repository.dart';
import 'features/pet/presentation/home_view.dart';
import 'features/pet/presentation/home_view_model.dart';

void main() {
  final viewModel = HomeViewModel(repository: PetRepository());
  runApp(PetCareApp(viewModel: viewModel));
}

class PetCareApp extends StatelessWidget {
  const PetCareApp({required this.viewModel, super.key});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetCare',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: HomeView(viewModel: viewModel),
    );
  }
}
