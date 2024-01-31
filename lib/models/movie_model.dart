class Movie {
  final int id;
  final String title;
  final String plot;
  final double rating;
  final List<String> genre;
  final List<String> cast;
  final int runtime;
  final Map<String, int> ticketPrices;
  final String posterUrl;

  Movie({
    required this.id,
    required this.title,
    required this.plot,
    required this.rating,
    required this.genre,
    required this.cast,
    required this.runtime,
    required this.ticketPrices,
    required this.posterUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      plot: json['plot'],
      rating: json['rating'].toDouble(),
      genre: List<String>.from(json['genre']),
      cast: List<String>.from(json['cast']),
      runtime: json['runtime'],
      ticketPrices: Map<String, int>.from(json['ticketPrices']),
      posterUrl: json['posterUrl'],
    );
  }
}
