import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/view/home_view.dart';
import 'package:flutter_testing/view/posts_view.dart';
import 'package:flutter_testing/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('HomeView Tests', () {
    testWidgets('Counter increments, decrements, and navigates to posts view', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (_) => HomeViewModel(),
            child: const HomeView(),
          ),
        ),
      );


      expect(find.text('0'), findsOneWidget);

      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.text('Increment'));
      await tester.pump();
      await Future.delayed(const Duration(seconds: 2));
      expect(find.text('1'), findsOneWidget);

      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.text('Decrement'));
      await tester.pump();
      await Future.delayed(const Duration(seconds: 2));
      expect(find.text('0'), findsOneWidget);

      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.text('Posts'));
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));
      expect(find.byType(PostsView), findsOneWidget);
    });
  });
}
