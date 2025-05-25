import 'package:bargify/models/dealmodels.dart';
import 'package:bargify/state/watchlist_state.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test('toggleStar adds deal if not in WatchList', () async {

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


final firestore = FakeFirebaseFirestore();
final auth = MockFirebaseAuth(mockUser: MockUser(uid: 'user'), signedIn: true);
final watchListState = WatchListState(auth: auth, firestore: firestore);

  expect(watchListState.watchList.contains(deal.id), false);

  await watchListState.toggleStar(deal);

  expect(watchListState.watchList.contains(deal.id), true);

   await watchListState.toggleStar(deal); // If starred, should delete from watchList when starred again

  expect(watchListState.watchList.contains(deal.id), false); 



});


}