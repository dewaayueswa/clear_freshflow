import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor:
            Colors.blue, // Mengubah warna latar belakang App Bar menjadi biru
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/about_us.png'),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Tentang Kami',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Jasa air galon yang kami sediakan adalah solusi terbaik untuk kebutuhan air bersih Anda. Dengan layanan pemesanan yang mudah dan sistem poin untuk diskon, kami memastikan kenyamanan dan kepuasan pelanggan. Lacak pesanan Anda dengan mudah melalui fitur pelacakan yang tersedia. Dapatkan kemudahan berkomunikasi melalui chat dengan admin kami. Segera nikmati layanan air galon terbaik hanya dengan beberapa klik!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 20.0),
              Text(
                'Layanan Utama:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  FeatureCard(
                    icon: Icons.check,
                    title: 'Pemesanan Mudah',
                    description:
                        'Pesan air galon dengan mudah melalui aplikasi kami.',
                  ),
                  FeatureCard(
                    icon: Icons.check,
                    title: 'Pengiriman Cepat',
                    description:
                        'Kami menjamin pengiriman air galon dengan cepat.',
                  ),
                  FeatureCard(
                    icon: Icons.check,
                    title: 'Pembayaran Aman',
                    description:
                        'Pembayaran Anda aman dan terjamin keamanannya.',
                  ),
                  FeatureCard(
                    icon: Icons.check,
                    title: 'Layanan Pelanggan 24/7',
                    description:
                        'Tim layanan pelanggan kami siap membantu Anda kapan saja.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
