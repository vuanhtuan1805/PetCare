import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
          appBar: AppBar(
            title: const Text('PetCare'),
            actions: [
              IconButton(
                onPressed: () => Supabase.instance.client.auth.signOut(),
                tooltip: 'Sign out',
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: const Center(child: Text('Home content coming soon')),
        );
      },
    );
  }
}
