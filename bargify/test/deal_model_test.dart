import 'package:bargify/models/dealmodels.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){

test('Check if data scaffold can be submitted to Firestore', () {

  final data = {
    'name': 'Test Sale',
    'Description': 'Test Description',
    'storeName': 'Test storeName',
    'Location': 'Test Location',
    'category': 'Electronics',
    'Price': 99.99,
    'Start': Timestamp.fromDate(DateTime(2025, 5, 25)),
    'End': Timestamp.fromDate(DateTime( 2025, 5, 28)),
    'imageURL': '',

  };

  final deal = Deal.fromFirestore('deal123', data);

  expect(deal.id, 'deal123');
  expect(deal.name, 'Test Sale');
  expect(deal.description, 'Test Description');
  expect(deal.storeName, 'Test storeName');
  expect(deal.location, 'Test Location');
  expect(deal.category, 'Electronics');
  expect(deal.price, 99.99);
  expect(deal.start, DateTime(2025,5,25));
  expect(deal.end, DateTime(2025,5,28));
  expect(deal.imageURL, '');


});

test('Check whether formatDate works', () {

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

expect(deal.formatDate(DateTime(2025,5,25)), '25-05-2025');
expect(deal.formatDate(DateTime(2025,5,28)), '28-05-2025');
expect(deal.formatDate(DateTime(2021,2,1)), '01-02-2021');
expect(deal.formatDate(DateTime(2023,1,19)), '19-01-2023');

});



}