import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:petcare/features/pet/data/pet_repository.dart';
import 'package:petcare/features/pet/presentation/home_view.dart';
import 'package:petcare/features/pet/presentation/home_view_model.dart';

void main() {
  testWidgets('home view renders a placeholder', (
    WidgetTester tester,
  ) async {
    final viewModel = HomeViewModel(repository: PetRepository());
    await tester.pumpWidget(
      MaterialApp(home: HomeView(viewModel: viewModel)),
    );
    await tester.pumpAndSettle();

    expect(find.text('Home content coming soon'), findsOneWidget);
  });
}
