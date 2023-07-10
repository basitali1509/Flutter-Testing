import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/Widget/home_screen.dart';
import 'package:testing/Widget/user_model.dart';
import 'package:testing/http/http_model.dart';


void main(){
  testWidgets(
      'Displays List of users with title as name and  subtitle as email',
          (tester) async {
        final users = [
          User1(id: 1, name: 'Rivaan', email: 'rivaan@gmail.com'),
          User1(id: 2, name: 'Naman', email: 'naman@gmail.com'),
        ];

        Future<List<User1>> mockFetchUsers() async {
          // return Future.delayed(
          //   const Duration(seconds: 1),
          //       () => users,

          // );
          return  users;
        }

        await tester.pumpWidget(
          MaterialApp(
            home: HomeScreen(
              futureUsers: mockFetchUsers(),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        await tester.pumpAndSettle();
        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(ListTile), findsNWidgets(users.length));

        for (final user in users) {
          expect(find.text(user.name), findsOneWidget);
          expect(find.text(user.email), findsOneWidget);
        }
  });
}