import 'package:flutter/material.dart';

class RiwayatTransaksi extends StatelessWidget {
  const RiwayatTransaksi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Transaksi'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_riwayat.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TransactionItem(
              orderId: '#07005',
              customerName: 'Dahayu',
              orderDate: '2024-03-7',
              deliveryAddress: 'Jl. Gajah Mada Blok C',
              gallonType: '1 Air Galon',
              jenisGalon: 'Le Mineral',
              quantity: 1,
              paymentMethod: 'COD',
              totalPrice: 200000,
            ),
            SizedBox(height: 16),
            TransactionItem(
              orderId: '18010',
              customerName: 'Dahayu',
              orderDate: '2024-03-18',
              deliveryAddress: 'Jl. Patimura',
              gallonType: '2 Gallon',
              jenisGalon: 'Aqua (dengan galon)',
              quantity: 2,
              paymentMethod: 'Transfer Bank',
              totalPrice: 750000,
            ),
            SizedBox(height: 16),
            TransactionItem(
              orderId: '12005',
              customerName: 'Dahayu',
              orderDate: '2024-04-12',
              deliveryAddress: 'Jl. Gajah Mada Blok C',
              gallonType: '3 Gallon',
              jenisGalon: 'Isi Ulang Air Oksigen',
              quantity: 3,
              paymentMethod: 'COD',
              totalPrice: 450000,
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String orderId;
  final String customerName;
  final String orderDate;
  final String deliveryAddress;
  final String gallonType;
  final String jenisGalon;
  final int quantity;
  final String paymentMethod;
  final int totalPrice;

  const TransactionItem({
    Key? key,
    required this.orderId,
    required this.customerName,
    required this.orderDate,
    required this.deliveryAddress,
    required this.gallonType,
    required this.jenisGalon,
    required this.quantity,
    required this.paymentMethod,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order ID: $orderId',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // navigasi lanjutan
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Text('Nama Customer: $customerName'),
            Text('Tanggal Order: $orderDate'),
            Text('Alamat: $deliveryAddress'),
            Text('Jumlah Galon: $gallonType'),
            Text('Jenis Air Galon: $jenisGalon'),
            Text('Quantity: $quantity'),
            Text('Metode Pembayaran: $paymentMethod'),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            Text(
              'Total: Rp $totalPrice',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
