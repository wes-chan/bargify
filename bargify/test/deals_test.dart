import 'package:bargify/screen/deals.dart';
import 'package:bargify/widgets/dealexpanded.dart';
import 'package:bargify/state/watchlist_state.dart'; 
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {

  testWidgets('Deal instance expands on press to DealExpenses, and displays information', (WidgetTester tester) async {

    final firestore = FakeFirebaseFirestore();

     await firestore.collection('deals').add({
      'name': 'Mock Deal',
      'Description': 'Description',
      'storeName': 'Store',
      'Location': 'Location',
      'category': 'Electronics',
      'Price': 99.99,
      'Start': DateTime.now(),
      'End': DateTime.now().add(Duration(days: 1)),
      'imageURL': '',
    });


    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => WatchListState(),
        child: MaterialApp(
          home: Deals(firestore: firestore),

        )



       )
    );
    await tester.pumpAndSettle();

    expect(find.text('Mock Deal'), findsOneWidget);

    await tester.tap(find.text('Mock Deal'));

    await tester.pumpAndSettle();

    expect(find.byType(DealExpanded), findsOneWidget);

    expect(find.text('\$99.99'), findsOneWidget);



  });


}