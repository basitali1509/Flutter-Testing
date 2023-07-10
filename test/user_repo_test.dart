
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing/http/http_model.dart';
import 'package:testing/http/http_repo.dart';

class MockHTTPClient extends Mock implements Client{

}

void main(){
  late MockHTTPClient mockHTTPClient;
  late UserRepository userRepository;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });

  group('User Repository', () {
    group('getUser function', () {
      test('given UserRepository class when getUser function is called and status code is 200 then a usermodel should be returned', ()
      async{

        // Arrange
        when(
              () => mockHTTPClient.get(
            Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
          ),
        ).thenAnswer((invocation) async {
          return Response('''
            {
              "id": 2,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april",
              "website": "hildegard.org"
            }
            ''', 200);
        });
        // Act
        final user = await userRepository.getUser();
        //Assert
        expect(user, isA<User>());
      }
      );
    });
  });


}