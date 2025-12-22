import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:drift/native.dart';

import 'package:patrimonio_narrativo/main.dart';
import 'package:patrimonio_narrativo/database/database.dart';
import 'package:patrimonio_narrativo/providers/auth_provider.dart';

void main() {
  testWidgets('Renders Login Screen', (WidgetTester tester) async {
    // Create an in-memory database for testing
    final database = AppDatabase(connection: NativeDatabase.memory());

    // Seed the database with initial data
    await database.seedDatabase();

    // Build the app in the test environment
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<AppDatabase>.value(value: database),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: const PatrimonioApp(),
      ),
    );

    // Wait for initial animations and data loading to complete
    await tester.pumpAndSettle();

    // Verify that the login screen elements are present
    expect(find.text('Patrimônio Narrativo'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2)); // User and Password
    expect(find.byType(ElevatedButton), findsOneWidget); // Login Button
  });
}
