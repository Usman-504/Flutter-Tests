import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/model/posts_model.dart';
import 'package:flutter_testing/repository/posts_repository.dart';
import 'package:flutter_testing/res/app_urls.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late PostsRepository postsRepository;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    postsRepository = PostsRepository(mockHTTPClient);
  });

  group('PostsRepository - ', () {
    group('getPosts function', () {
      test(
        'given PostsRepository class when getPosts function is called and status code is 200 then a PostsModel should be returned',
            () async {
          // Arrange
              when(() => mockHTTPClient.get(Uri.parse(AppUrls.posts)))
                  .thenAnswer((_) async => Response('''
    [
      {
        "userId": 1,
        "id": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "quia et suscipit\\nsuscipit recusandae consequuntur expedita et cum\\nreprehenderit molestiae ut ut quas totam\\nnostrum rerum est autem sunt rem eveniet architecto"
      }
    ]
  ''', 200));


          // Act
          final user = await postsRepository.getPosts();
          // Assert
          expect(user, isA<List<PostsModel>>());
        },
      );

      test(
        'given PostsRepository class when getPosts function is called and status code is not 200 then an exception should be thrown',
            () async {
          // arrange
          when(
                () => mockHTTPClient.get(
              Uri.parse(AppUrls.posts),
            ),
          ).thenAnswer((invocation) async => Response('{}', 500));
          // act
           final user = postsRepository.getPosts();
          // assert
          expect(user, throwsException);
        },
      );
    });
  });
}