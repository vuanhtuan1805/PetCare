import 'package:flutter/material.dart';

import '../domain/pet.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({required this.viewModel, super.key});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('PetCare')),
          body: _HomeBody(viewModel: viewModel),
        );
      },
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return Center(
        child: FilledButton.icon(
          onPressed: viewModel.loadPets,
          icon: const Icon(Icons.refresh),
          label: const Text('Try again'),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Good morning', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          'Keep up with your pets\' care in one place.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        Text('Your pets', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        for (final pet in viewModel.pets)
          _PetCard(pet: pet, viewModel: viewModel),
      ],
    );
  }
}

class _PetCard extends StatelessWidget {
  const _PetCard({required this.pet, required this.viewModel});

  final Pet pet;
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(child: Text(pet.name[0])),
        title: Text(pet.name),
        subtitle: Text('${pet.species}\n${pet.nextAppointment}'),
        isThreeLine: true,
        trailing: IconButton(
          onPressed: () => viewModel.toggleFavorite(pet.id),
          tooltip: pet.isFavorite ? 'Remove favorite' : 'Add favorite',
          icon: Icon(pet.isFavorite ? Icons.favorite : Icons.favorite_border),
        ),
      ),
    );
  }
}