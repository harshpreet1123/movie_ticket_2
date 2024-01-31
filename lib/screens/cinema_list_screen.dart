import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'dart:convert';
import 'package:movie_ticket_2/consts/jsons.dart';
import 'package:movie_ticket_2/models/cinema_model.dart';
import 'package:movie_ticket_2/provider/cinema_provider.dart';
import 'package:movie_ticket_2/screens/movie_list_screen.dart';
import 'package:provider/provider.dart';

class CinemaListPage extends StatefulWidget {
  const CinemaListPage({super.key});

  @override
  CinemaListPageState createState() => CinemaListPageState();
}

class CinemaListPageState extends State<CinemaListPage> {
  final Dio _dio = Dio();
  late final DioAdapter _adapter;

  @override
  void initState() {
    super.initState();
    _adapter = DioAdapter(dio: _dio);
    _dio.httpClientAdapter = _adapter;
    _setupMockAdapter();
  }

  void _setupMockAdapter() {
    final cinemasJson = kCinemaJson;
    _adapter.onGet('https://example.com/cinemas', (server) {
      server.reply(200, cinemasJson);
    });
  }

  @override
  Widget build(BuildContext context) {
    CinemaProvider cinemaProvider = Provider.of<CinemaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinemas'),
      ),
      body: FutureBuilder(
        future: _fetchCinemas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final cinemasData = snapshot.data as List<dynamic>;
            final List<Cinema> cinemas = cinemasData
                .map<Cinema>((cinemaData) => Cinema(
                      id: cinemaData['id'],
                      name: cinemaData['name'],
                      image: cinemaData['image'],
                      movies: List<int>.from(cinemaData['movies']),
                    ))
                .toList();
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemCount: cinemas.length,
                itemBuilder: (conetxt, index) {
                  final cinema = cinemas[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () {
                        cinemaProvider.add(cinema);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieListPage()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            cinema.image,
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            cinema.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }

  Future<List<dynamic>> _fetchCinemas() async {
    final response = await _dio.get('https://example.com/cinemas');
    if (response.statusCode == 200) {
      return json.decode(response.data) as List<dynamic>;
    } else {
      throw Exception('Failed to load cinemas');
    }
  }
}
