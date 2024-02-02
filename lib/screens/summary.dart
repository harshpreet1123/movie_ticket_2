import 'package:flutter/material.dart';
import 'package:movie_ticket_2/models/cinema_model.dart';
import 'package:movie_ticket_2/models/movie_model.dart';
import 'package:movie_ticket_2/models/payment_model.dart';
import 'package:movie_ticket_2/models/price_model.dart';
import 'package:movie_ticket_2/provider/cinema_provider.dart';
import 'package:movie_ticket_2/provider/movie_provider.dart';
import 'package:movie_ticket_2/provider/price_provider.dart';
import 'package:movie_ticket_2/provider/payment_provider.dart';
import 'package:movie_ticket_2/screens/cinema_list_screen.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cinemaProvider = Provider.of<CinemaProvider>(context);
    final movieProvider = Provider.of<MovieProvider>(context);
    final priceProvider = Provider.of<PriceProvider>(context);
    final paymentProvider = Provider.of<PaymentProvider>(context);

    final selectedCinema = cinemaProvider.cinemas.firstWhere(
      (cinema) => cinema.id == cinemaProvider.selectedCinemaId,
      orElse: () => Cinema(id: -1, name: 'N/A', image: '', movies: []),
    );

    final selectedMovie = movieProvider.movie.isNotEmpty
        ? movieProvider.movie.first
        : Movie(
            id: -1,
            title: 'N/A',
            plot: '',
            rating: 0,
            genre: [],
            cast: [],
            runtime: 0,
            ticketPrices: {},
            posterUrl: '',
          );

    final selectedPrice = priceProvider.price.isNotEmpty
        ? priceProvider.price.first
        : Price(type: 'N/A', price: 0);

    final selectedPayment = paymentProvider.payment.isNotEmpty
        ? paymentProvider.payment.first
        : Payment(method: 'N/A');

    return Scaffold(
      appBar: AppBar(title: Text('Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text('Cinema:'),
                  subtitle: Text(selectedCinema.name),
                ),
                ListTile(
                  title: Text('Movie:'),
                  subtitle: Text(selectedMovie.title),
                ),
                ListTile(
                  title: Text('Ticket Type:'),
                  subtitle: Text(selectedPrice.type),
                ),
                ListTile(
                  title: Text('Ticket Price:'),
                  subtitle: Text('\$${selectedPrice.price}'),
                ),
                ListTile(
                  title: Text('Payment Method:'),
                  subtitle: Text(selectedPayment.method),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>CinemaListPage()), (route) => false);
      }),
    );
  }
}
