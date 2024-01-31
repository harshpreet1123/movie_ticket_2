import 'package:flutter/material.dart';
import 'package:movie_ticket_2/models/payment_model.dart';

class PaymentProvider extends ChangeNotifier {
  final List<Payment> _payment = [];
  List<Payment> get payment => _payment;

  void add(Payment payment) {
    _payment.add(payment);
    notifyListeners();
  }

  void remove(Payment payment) {
    _payment.remove(payment);
    notifyListeners();
  }
}
