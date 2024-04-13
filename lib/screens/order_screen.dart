import 'package:flutter/material.dart';
import 'package:clear_fresh/screens/order2.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Air Galon'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back_chat.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pilih jumlah galon air yang ingin Anda pesan:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              _buildOrderButton(context, '1 Air Galon'),
              SizedBox(height: 10),
              _buildOrderButton(context, '2 Air Galon'),
              SizedBox(height: 10),
              _buildOrderButton(context, '3 Air Galon'),
              SizedBox(height: 10),
              _buildOrderButton(context, 'Custom'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderButton(BuildContext context, String quantity) {
    return ElevatedButton(
      onPressed: () {
        if (quantity == 'Custom Quantity') {
          Navigator.pushNamed(context, '/custom_order');
        } else {
          _showOrderConfirmation(context, quantity);
        }
      },
      child: Text(quantity),
    );
  }

  void _showOrderConfirmation(BuildContext context, String quantity) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Order'),
          content:
              Text('Kamu memesan $quantity, yakin melanjutkan ke pembelian.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigasi ke halaman OrderGallonScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderGallonScreen()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class Order2Screen extends StatelessWidget {
  const Order2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Order'),
      ),
      body: Center(
        child: Text(
          'This is the Order2Screen',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
