import 'dart:collection';

import 'package:bargify/models/dealmodels.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class WatchListState extends ChangeNotifier{
  final FirebaseAuth? auth;
  final FirebaseFirestore firestore;

  WatchListState({
    this.auth,
    required this.firestore,
  });




  final Set<String> _watchListDealIds = {};
  User? get user => auth?.currentUser;

  UnmodifiableSetView<String> get watchList => UnmodifiableSetView(_watchListDealIds);

// Load the watchlist by scanning every instance of deals stored under their UID
  Future<void> loadWatchlist() async {
    if (user == null){
      return;
    }

    final snapshot = await firestore.collection('users').doc(user!.uid).collection('watchlist').get();

    _watchListDealIds.clear();

    for (var doc in snapshot.docs){
      _watchListDealIds.add(doc.id);
    }
 
    notifyListeners();

  }
// Main toggle system. It checks the user's list whether it is in the list or not.


  Future<void> toggleStar(Deal deal) async {


    

    final data = firestore.collection('users').doc(user!.uid).collection('watchlist').doc(deal.id);

    if(_watchListDealIds.contains(deal.id)){
      await data.delete();
      _watchListDealIds.remove(deal.id);

    } else {
       await data.set({
                          'name': deal.name,
                          'Description': deal.description,
                          'storeName': deal.storeName,
                          'Location': deal.location,
                          'category': deal.category,
                          'Price': deal.price,
                          'Start': deal.start,
                          'End': deal.end,
                          'imageURL': deal.imageURL ?? '',
        
                          });

                          _watchListDealIds.add(deal.id);

    }
    notifyListeners();


  }

  Future<void> removefromWatchList(String dealId) async {
    if (user == null){
      return;
    }


    await firestore.collection('users').doc(user!.uid).collection('watchlist').doc(dealId).delete();

    _watchListDealIds.remove(dealId);
    notifyListeners();

  }

  void clear(){
    _watchListDealIds.clear();
    notifyListeners();
  }






}
