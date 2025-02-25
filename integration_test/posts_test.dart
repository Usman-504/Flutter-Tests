import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/view/posts_view.dart';
import 'package:flutter_testing/model/posts_model.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();


    testWidgets('PostsView displays posts and handles loading state', (WidgetTester tester) async {
      final mockPosts = Future.value([
        PostsModel(userId: 1, id: 1, title: 'Test Post 1', body: 'This is a test post body 1'),
        PostsModel(userId: 2, id: 2, title: 'Test Post 2', body: 'This is a test post body 2'),
      ]);

      await tester.pumpWidget(
        MaterialApp(
          home: PostsView(futurePosts: mockPosts),
        ),
      );

      await Future.delayed(const Duration(seconds: 2));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);


      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));
      expect(find.text('Test Post 1'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));
      expect(find.text('Test Post 2'), findsOneWidget);
    });



}
