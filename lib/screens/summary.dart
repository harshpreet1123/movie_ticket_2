import 'package:flutter/material.dart';
import 'package:movie_ticket_2/provider/cinema_provider.dart';
import 'package:movie_ticket_2/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cinemaId = Provider.of<CinemaProvider>(context).selectedCinemaId;
    return Scaffold(
      appBar: AppBar(title: Text('Summary')),
      body:Consumer<MovieProvider>(builder: (context,provider,_){
        return Column(
        children: [
          Text('Cinema Id $cinemaId'),
          Text('${provider.movie}')
        ],
      );
      })
    );
  }
}

