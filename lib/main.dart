import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/supabase/supabase_config.dart';
import 'features/auth/presentation/auth_gate.dart';
import 'features/pet/data/pet_repository.dart';
import 'features/pet/presentation/home_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: SupabaseConfig.url,
    publishableKey: SupabaseConfig.publishableKey,
  );

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
      home: AuthGate(viewModel: viewModel),
    );
  }
}
