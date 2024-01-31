import 'package:flutter/material.dart';
import 'package:movie_ticket_2/models/price_model.dart';
import 'package:movie_ticket_2/provider/price_provider.dart';
import 'package:movie_ticket_2/screens/payment.dart';
import 'package:provider/provider.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage(
      {Key? key,
      required this.poster,
      required this.price,
      required this.title})
      : super(key: key);
  final String title;
  final String poster;
  final dynamic price;

  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  bool _isVipSelected = false;
  int _currentPrice = 0;

  @override
  void initState() {
    super.initState();
    _currentPrice = widget.price['vip']; // Initialize with regular price
  }

  @override
  Widget build(BuildContext context) {
    PriceProvider priceProvider = Provider.of<PriceProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Book Ticket')),
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.70,
            child: Column(
              children: [
                Row(
                  children: [
                    Image.network(widget.poster, height: 150, width: 150),
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                ToggleButtons(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Regular'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('VIP'),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      _isVipSelected = index == 0;
                      _currentPrice = _isVipSelected
                          ? widget.price['regular']
                          : widget.price['vip'];
                    });
                  },
                  isSelected: [_isVipSelected, !_isVipSelected],
                ),
                SizedBox(height: 20),
                Text('Price: \$$_currentPrice'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String type;
              if(_isVipSelected==true){
                type='VIP';
              }else{
                type='Regular';
              }
              priceProvider.add(Price(type: type, price: _currentPrice));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PaymentScreen(price: _currentPrice)));
            },
            child: Text(
              "Pay: \$${_currentPrice}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }
}
