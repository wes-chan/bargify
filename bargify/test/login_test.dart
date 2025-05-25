import 'package:bargify/state/watchlist_state.dart';
import 'package:bargify/widgets/login.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main(){

   final firestore = FakeFirebaseFirestore();
    testWidgets('Login Form, sucessfully logged in', (WidgetTester tester) async {

    final email = "test@example.com";
    final password = "password123";

    final mockUser = MockUser(
      uid: 'test-user',
      email: email,
  

    );

    final mockFirebaseAuth = MockFirebaseAuth(
      signedIn : false,
      mockUser: mockUser,

    );


    expect(mockFirebaseAuth.currentUser, null);

    await tester.pumpWidget(
      ChangeNotifierProvider(
      create: (context) => WatchListState(firestore: firestore),
      child: MaterialApp(
        home: Login(auth: mockFirebaseAuth)
      ),
      )

    );

    final emailInput = find.widgetWithText(TextField, "Email");
    final passwordInput = find.widgetWithText(TextField, "Password");
    final loginButton = find.text("Sign in").last;

    await tester.enterText(emailInput, email);
    await tester.enterText(passwordInput, password);
    await tester.tap(loginButton);

    await tester.pumpAndSettle();
    
    expect(mockFirebaseAuth.currentUser?.email, email);




  });






}