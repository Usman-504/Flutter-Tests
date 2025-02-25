import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/model/posts_model.dart';
import 'package:flutter_testing/view/posts_view.dart';


void main() {
  testWidgets(
    'Displays List of posts with title and  subtitle',
        (tester) async {
      final posts = [
        PostsModel(title: 'hi', body: 'abc' ),
        PostsModel(title: 'hello', body: 'xyz' ),

      ];

      Future<List<PostsModel>> mockFetchUsers() {
        return Future.delayed(
          const Duration(seconds: 1),
              () => posts,
        );
      }

      await tester.pumpWidget(
        MaterialApp(
          home: PostsView(
futurePosts: mockFetchUsers(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(posts.length));

      for (final post in posts) {
        expect(find.text(post.title!), findsOneWidget);
        expect(find.text(post.body!), findsOneWidget);
      }
    },
  );
}