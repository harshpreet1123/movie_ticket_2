import 'package:flutter/material.dart';
import 'package:movie_ticket_2/provider/cinema_provider.dart';
import 'package:movie_ticket_2/provider/movie_provider.dart';
import 'package:movie_ticket_2/provider/payment_provider.dart';
import 'package:movie_ticket_2/provider/price_provider.dart';
import 'package:movie_ticket_2/screens/cinema_list_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CinemaProvider>(create: (_) => CinemaProvider()),
        ChangeNotifierProvider<MovieProvider>(create: (_) => MovieProvider(),),
        ChangeNotifierProvider<PriceProvider>(create: (_) => PriceProvider(),),
        ChangeNotifierProvider<PaymentProvider>(create: (_) => PaymentProvider(),),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Ticket Booking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CinemaListPage(),
    );
  }
}
