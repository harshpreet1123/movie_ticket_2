import 'package:flutter/material.dart';
import 'package:movie_ticket_2/models/price_model.dart';

class PriceProvider extends ChangeNotifier{
  final List<Price> _price =[];
  List <Price> get price => _price;

  void add(Price price){
    _price.add(price);
    notifyListeners();
  }
  void remove(Price price){
    _price.remove(price);
    notifyListeners();
  }
}