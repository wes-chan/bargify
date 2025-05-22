

import 'package:intl/intl.dart';

class Deal {
  final String id;
  final String name;
  final String description;
  final String storeName;
  final String location;
  final String category;
  final double price;
  final DateTime start;
  final DateTime end;

  Deal({
    required this.id,
    required this.name,
    required this.description,
    required this.storeName,
    required this.location,
    required this.category,
    required this.price,
    required this.start,
    required this.end,
  });

  factory Deal.fromFirestore(String id, Map<String, dynamic> data){
    return Deal(
      id: id,
      name: data['name'],
      description: data['Description'],
      storeName: data["storeName"],
      location: data["Location"],
      category: data["category"],
      price: data["Price"].toDouble(),
      start: data["Start"].toDate(),
      end: data["End"].toDate(),
      
    );
  }

    String formatDate(DateTime time){
    return DateFormat('dd-MM-yyyy').format(time);
  }



}



class CategoryModel {
  static const List<String> categoryOptions = ['Electronics', 'Home & Living', 'Fashion', 'Toys & Games', 'Beauty', 'Automotive', 'Other'];

}

