import 'package:flutter/material.dart';
import 'package:movie_ticket_2/models/movie_model.dart';
import 'package:movie_ticket_2/provider/movie_provider.dart';
import 'package:movie_ticket_2/screens/book_ticket_screen.dart';
import 'package:provider/provider.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    MovieProvider movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Image.network(movie.posterUrl),
            SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Center(
              child: Text(
                movie.title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                '⭐ ${movie.rating}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var item in movie.genre)
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('$item '),
                  )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(movie.plot),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: FloatingActionButton.large(onPressed: (){
      movieProvider.add(movie);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SeatSelectionPage(title:movie.title,poster:movie.posterUrl,price:movie.ticketPrices)));},child: Text('Select Seats'),),
    );
  }
}
