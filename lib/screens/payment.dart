import 'package:flutter/material.dart';
import 'package:movie_ticket_2/models/payment_model.dart';
import 'package:movie_ticket_2/provider/payment_provider.dart';
import 'package:movie_ticket_2/screens/summary.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.price});
  final int price;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isUPISelected = false;

  @override
  Widget build(BuildContext context) {
    PaymentProvider paymentProvider = Provider.of<PaymentProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Select payment Method'),
        ),
        body: Column(
          children: [
            Text(
              '\$${widget.price}',
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.70,
              child: Center(
                child: ToggleButtons(
                  onPressed: (int index) {
                    setState(() {
                      isUPISelected = index == 0;
                    });
                  },
                  isSelected: [isUPISelected, !isUPISelected],
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('UPI'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Net Banking'),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String method;
                if(isUPISelected==true){
                  method='UPI';
                }else{
                  method='NetBanking';
                }
                paymentProvider.add(Payment(method: method));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SummaryScreen()));
              },
              child: Text(
                "Complete Booking",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}
