import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../pet/presentation/home_view.dart';
import '../../pet/presentation/home_view_model.dart';
import 'auth_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({required this.viewModel, super.key});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final session =
            snapshot.data?.session ??
            Supabase.instance.client.auth.currentSession;

        if (session == null) {
          return const AuthPage();
        }

        return HomeView(viewModel: viewModel);
      },
    );
  }
}
