import 'package:bargify/models/dealmodels.dart';
import 'package:bargify/screen/form.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  final firestore = FakeFirebaseFirestore();

    testWidgets('Uploading a new deal', (WidgetTester tester) async {



    await tester.pumpWidget(

       MaterialApp(
        home: Forms(firestore: firestore),
      ),
      

    );

    final titleField = find.widgetWithText(TextField, 'Title *');
    final categoryField = find.widgetWithText(DropdownButtonFormField<String>, 'Category *');
    final priceField = find.widgetWithText(TextField, 'Price *');
    final storeNameField = find.widgetWithText(TextField, 'Store Name *');

    final locationField = find.widgetWithText(TextField, 'Location *');
    final startField = find.widgetWithText(TextField, 'Start *');
    final endField = find.widgetWithText(TextField, 'End *');
    final descriptionField = find.widgetWithText(TextField, 'Description *');

    final submit = find.widgetWithText(ElevatedButton, 'Submit');

    await tester.enterText(titleField, 'Test Deal');
    await tester.enterText(priceField, '99.99');
    await tester.enterText(storeNameField, 'Store Name');
    await tester.enterText(locationField, 'Location Test');
    await tester.enterText(descriptionField, 'Description test');

    await tester.tap(categoryField);
    await tester.pumpAndSettle();
    final firstCategory = find.text(CategoryModel.categoryOptions.first).last;
    await tester.tap(firstCategory);
    await tester.pumpAndSettle();

    await tester.tap(startField);
      await tester.pumpAndSettle();
    await tester.tap(find.text('20'));
    await tester.tap(find.text('OK'));

   await tester.pumpAndSettle(); 

    await tester.tap(endField);
      await tester.pumpAndSettle();
    await tester.tap(find.text('26'));
    await tester.tap(find.text('OK'));
       await tester.pumpAndSettle(); 

  await tester.tap(submit);
  await tester.pumpAndSettle();

 


expect(find.text('Deal submitted!'), findsOneWidget);



    







  });






}