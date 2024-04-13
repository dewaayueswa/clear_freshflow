import 'package:flutter/material.dart';

class OrderGallonScreen extends StatelessWidget {
  const OrderGallonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String quantity = '1 Gallon';
    String paymentMethod = 'COD';

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Air Galon'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back_chat.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Information Order',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildTextField('Nama Pemesan'),
              SizedBox(height: 10),
              _buildTextField('Nomor Telepon'),
              SizedBox(height: 10),
              _buildTextField('Alamat Lengkap'),
              SizedBox(height: 10),
              _buildDropdownField('Jumlah Galon', [quantity]),
              SizedBox(height: 10),
              _buildDropdownField('Metode Pembayaran', ['COD']),
              SizedBox(height: 20),
              Text(
                'Price: ${_calculatePrice()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _placeOrder(context, paymentMethod);
                },
                child: Text('Order Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDropdownField(String labelText, List<String> options) {
    String dropdownValue = options.first;

    return DropdownButtonFormField<String>(
      value: dropdownValue,
      onChanged: (newValue) {
        dropdownValue = newValue!;
      },
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }

  String _calculatePrice() {
    return 'Rp 40,000';
  }

  void _placeOrder(BuildContext context, String paymentMethod) {
    final orderId = '#12005';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Order Berhasil Terkirim',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'ID Order: $orderId',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Pilihan Pembayaran: $paymentMethod',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Navigate back to previous screen after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pop(context);
    });
  }
}
