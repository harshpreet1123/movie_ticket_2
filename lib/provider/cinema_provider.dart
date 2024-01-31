import 'package:flutter/material.dart';
import 'package:movie_ticket_2/models/cinema_model.dart';

class CinemaProvider extends ChangeNotifier {
  int? _selectedCinemaId;
  int? get selectedCinemaId => _selectedCinemaId;

  final List<Cinema> _cinemas = [];
  List<Cinema> get cinemas => _cinemas;

  get movie => null;

  void add(Cinema cinema) {
    _cinemas.add(cinema);
    _selectedCinemaId = cinema.id; // Update selected cinema ID
    notifyListeners();
  }

  void remove(Cinema cinema) {
    _cinemas.remove(cinema);
    notifyListeners();
  }
}
