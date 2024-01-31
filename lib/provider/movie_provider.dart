import 'package:flutter/material.dart';
import 'package:movie_ticket_2/models/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  int? _selectedMovieId;
  int? get selectedMovieId => _selectedMovieId;

  final List<Movie> _movie = [];
  List<Movie> get movie => _movie;

  void add(Movie movie) {
    _movie.add(movie);
    notifyListeners();
  }

  void remove(Movie movie) {
    _movie.remove(movie);
    notifyListeners();
  }

}
