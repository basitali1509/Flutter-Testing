import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:testing/home_page.dart';

void main(){
  testWidgets( 'given counter is 0 when increment button is clicked then counter should be 1',
          (tester) async {
      await tester.pumpWidget(
         const MaterialApp(
           home: MyHomePage(title: 'Counter App'),
         )
       );
      expect(find.text('0'), findsOneWidget);
      final ctr2 = find.text('1');
      expect(ctr2, findsNothing);

      final incrementBtn = find.byTooltip('Increment');
      // final incrementBtn = find.byType(FloatingActionButton);
      await tester.tap(incrementBtn);
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);

      expect(find.byType(AppBar), findsOneWidget);
          });



}