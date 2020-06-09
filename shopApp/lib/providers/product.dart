import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavourite;

  void toggleFavourite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }

  Product({
    this.title,
    this.id,
    this.description,
    this.imageUrl,
    this.price,
    this.isFavourite = false,
  });
}
