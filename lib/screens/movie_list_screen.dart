import 'package:flutter/material.dart';
import 'package:movie_ticket_2/consts/jsons.dart';
import 'package:movie_ticket_2/models/cinema_model.dart';
import 'package:movie_ticket_2/models/movie_model.dart';
import 'package:movie_ticket_2/provider/cinema_provider.dart';
import 'package:movie_ticket_2/screens/movie_details_screen.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cinemaId = Provider.of<CinemaProvider>(context).selectedCinemaId;
    final List<dynamic> moviesData = json.decode(kMoviesJson);

    // Retrieve cinemas data
    final List<Cinema> cinemas = Provider.of<CinemaProvider>(context).cinemas;

    // Filter movies based on whether the selected cinema has them
    final List<Movie> movies = cinemas
        .where((cinema) => cinema.id == cinemaId)
        .expand((cinema) => cinema.movies)
        .toSet() // Ensure unique movie IDs
        .map((movieId) => moviesData.firstWhere((movie) => movie['id'] == movieId))
        .map<Movie>((movieData) => Movie.fromJson(movieData))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          return ListTile(
            leading: Image.network(
              movie.posterUrl,
              height: 100,
              width: 100,
            ),
            title: Text(
              movie.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('⭐ ${movie.rating}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailsPage(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
