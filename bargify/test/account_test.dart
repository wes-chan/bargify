import 'package:bargify/screen/account.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){


final signedOut = MockFirebaseAuth(signedIn: false);

 testWidgets('Watch List disabled on logged out, Log in should be displayed instead of Logout', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Account(auth: signedOut),

    )

  
  );

  expect(find.text('Log In'), findsOneWidget);
   expect(find.text('Settings'), findsOneWidget);

  final watchList = find.text('Watch List');

  await tester.tap(watchList);
  await tester.pumpAndSettle();

  expect(find.text('Please sign in to use Watch List'), findsOneWidget);
   await tester.pumpAndSettle();
  






 });




  
}