import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/view/home_view.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_testing/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login Tests', () {
    testWidgets(
      'verify login screen with correct username and password',
          (tester) async {
        app.main();
        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 2));
        await tester.enterText(find.byType(TextFormField).at(0), 'username');
        await Future.delayed(const Duration(seconds: 2));
        await tester.enterText(find.byType(TextFormField).at(1), 'password');
        await Future.delayed(const Duration(seconds: 2));
        await tester.tap(find.byType(ElevatedButton));
        await Future.delayed(const Duration(seconds: 2));
        await tester.pumpAndSettle();

        await Future.delayed(const Duration(seconds: 2));
        expect(find.byType(HomeView), findsOneWidget);
      },
    );

    testWidgets(
      'verify login screen with incorrect username and password',
          (tester) async {
        app.main();
        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 2));
        await tester.enterText(find.byType(TextFormField).at(0), 'usman');
        await Future.delayed(const Duration(seconds: 2));
        await tester.enterText(find.byType(TextFormField).at(1), 'usman123');
        await Future.delayed(const Duration(seconds: 2));
        await tester.tap(find.byType(ElevatedButton));
        await Future.delayed(const Duration(seconds: 2));
        await tester.pumpAndSettle();

        await Future.delayed(const Duration(seconds: 2));
        expect(find.text('Invalid username or password'), findsOneWidget);
      },
    );
  });
}
