import 'dart:collection';

import 'package:bargify/models/dealmodels.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class WatchListState extends ChangeNotifier{
  final Set<String> _watchListDealIds = {};
  User? get user => FirebaseAuth.instance.currentUser;

  UnmodifiableSetView<String> get watchList => UnmodifiableSetView(_watchListDealIds);

  Future<void> loadWatchlist() async {
    if (user == null){
      return;
    }

    final snapshot = await FirebaseFirestore.instance.collection('users').doc(user!.uid).collection('watchlist').get();

    _watchListDealIds.clear();

    for (var doc in snapshot.docs){
      _watchListDealIds.add(doc.id);
    }
 
    notifyListeners();

  }


  Future<void> toggleStar(Deal deal) async {

    final data = FirebaseFirestore.instance.collection('users').doc(user!.uid).collection('watchlist').doc(deal.id);

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
        
                          });

                          _watchListDealIds.add(deal.id);

    }
    notifyListeners();


  }

  Future<void> removefromWatchList(String dealId) async {
    if (user == null){
      return;
    }


    await FirebaseFirestore.instance.collection('users').doc(user!.uid).collection('watchlist').doc(dealId).delete();

    _watchListDealIds.remove(dealId);
    notifyListeners();

  }

  void clear(){
    _watchListDealIds.clear();
    notifyListeners();
  }






}
