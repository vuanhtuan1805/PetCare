import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:petcare/features/pet/data/pet_repository.dart';
import 'package:petcare/features/pet/presentation/home_view.dart';
import 'package:petcare/features/pet/presentation/home_view_model.dart';

void main() {
  testWidgets('home view renders pets and toggles favorites', (
    WidgetTester tester,
  ) async {
    final viewModel = HomeViewModel(repository: PetRepository());
    await tester.pumpWidget(
      MaterialApp(home: HomeView(viewModel: viewModel)),
    );
    await tester.pumpAndSettle();

    expect(find.text('Luna'), findsOneWidget);
    expect(find.text('Milo'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsNWidgets(2));
  });
}
