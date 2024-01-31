final String kCinemaJson = '''[
    {
        "id": 1,
        "name": "Cinema City",
        "image": "https://play-lh.googleusercontent.com/sITSB5YH4Q1nlEjevvkYf_5a7aAFB__IHjhbvMibIAnaq0_mjwWPRjy6k6loq7Ubnfc",
        "movies": [
            101,
            102
        ]
    },
    {
        "id": 2,
        "name": "Starplex Cinemas",
        "image": "https://pbs.twimg.com/profile_images/560559420547952640/yYeeS5qP_400x400.jpeg",
        "movies": [
            101,
            103
        ]
    },
    {
        "id": 3,
        "name": "PVR",
        "image": "https://www.dlfpromenade.com/Assets/stores/832d34dc-25b4-4e44-a8a3-3fcd1edea9a6.png",
        "movies": [
            102,
            104
        ]
    }
]
''';

final String kMoviesJson = '''[
  {
    "id": 101,
    "title": "The Shawshank Redemption",
    "plot": "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
    "rating": 9.3,
    "genre": ["Drama"],
    "cast": ["Tim Robbins", "Morgan Freeman"],
    "runtime": 142,
    "ticketPrices": {
      "regular": 10,
      "vip": 15
    },
    "posterUrl": "https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_.jpg"
  },
  {
    "id": 102,
    "title": "The Godfather",
    "plot": "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
    "rating": 9.2,
    "genre": ["Crime", "Drama"],
    "cast": ["Marlon Brando", "Al Pacino"],
    "runtime": 175,
    "ticketPrices": {
      "regular": 12,
      "vip": 20
    },
    "posterUrl": "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg"
  },
  {
    "id": 103,
    "title": "The Dark Knight",
    "plot": "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
    "rating": 9,
    "genre": ["Action", "Crime", "Drama"],
    "cast": ["Christian Bale", "Heath Ledger"],
    "runtime": 152,
    "ticketPrices": {
      "regular": 11,
      "vip": 18
    },
    "posterUrl": "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg"
  },
  {
    "id": 104,
    "title": "A Silent Voice",
    "plot": "A young man is ostracized by his classmates after he bullies a deaf girl to the point where she moves away. Years later, he sets off on a path for redemption",
    "rating": 8,
    "genre": ["Drama", "Slice of Life", "Romantic"],
    "cast": ["Amber Lee", "Naoka Ueno"],
    "runtime": 152,
    "ticketPrices": {
      "regular": 12,
      "vip": 20
    },
    "posterUrl": "https://m.media-amazon.com/images/M/MV5BZGRkOGMxYTUtZTBhYS00NzI3LWEzMDQtOWRhMmNjNjJjMzM4XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg"
  }
]
''';