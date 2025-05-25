

import 'package:bargify/models/dealmodels.dart';
import 'package:bargify/widgets/dealexpanded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
   testWidgets('Check the existance of Deal Expanded widget', (WidgetTester tester) async {
  final deal = Deal(
  id: 'deal123',
  name: 'Test Sale',
  description: 'Test Description',
  storeName: 'Test storeName',
  location: 'Test Location',
  category: 'Electronics',
  price: 99.99,
  start: DateTime(2025,5,25),
  end: DateTime(2025,5,28),
  imageURL: '',
  );

  await tester.pumpWidget(
    MaterialApp(
      home: DealExpanded(deal: deal),
    ),
  
);

expect(find.text('Test Sale'), findsOneWidget);
expect(find.text('Test Description'), findsOneWidget);
expect(find.text('Test storeName'), findsOneWidget);

expect(find.text('Test Location'), findsOneWidget);
expect(find.text('Electronics'), findsOneWidget);
expect(find.text('Test storeName'), findsOneWidget);

expect(find.text('\$99.99'), findsOneWidget);
expect(find.text('25-05-2025'), findsOneWidget);
expect(find.text('28-05-2025'), findsOneWidget);


   });


}