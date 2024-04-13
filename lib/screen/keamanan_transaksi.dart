import 'package:flutter/material.dart';

class KeamananTransaksi extends StatelessWidget {
  const KeamananTransaksi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keamanan Transaksi'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/keamanan.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fitur Keamanan Transaksi',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.black,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              _buildFeature(
                title: '1. Sistem Enkripsi Data',
                description:
                    'Data transaksi pelanggan dienkripsi untuk melindungi informasi sensitif seperti nomor kartu kredit dan data pribadi lainnya.',
              ),
              SizedBox(height: 16),
              _buildFeature(
                title: '2. Verifikasi Identitas Pelanggan',
                description:
                    'Setiap transaksi melalui metode pembayaran online dilengkapi dengan verifikasi identitas pelanggan untuk menghindari penggunaan yang tidak sah.',
              ),
              SizedBox(height: 16),
              _buildFeature(
                title: '3. Penggunaan Teknologi SSL',
                description:
                    'Aplikasi menggunakan teknologi SSL (Secure Socket Layer) untuk mengamankan komunikasi antara pengguna dan server, sehingga informasi yang dikirimkan tetap terjaga keamanannya.',
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // navigasi lanjutan
                  },
                  child: Text(
                    'Tetap Jaga Data Anda',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildTips(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeature({required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 2,
                color: Colors.black,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 2,
                color: Colors.black,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey),
      ],
    );
  }

  Widget _buildTips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tips Keamanan Transaksi:',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 2,
                color: Colors.black,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        _buildTip(
          title: 'Gunakan Koneksi Aman',
          description:
              'Pastikan Anda menggunakan koneksi internet yang aman dan terpercaya saat melakukan transaksi online.',
        ),
        _buildTip(
          title: 'Periksa URL',
          description:
              'Selalu periksa URL situs web saat melakukan pembayaran online untuk memastikan Anda berada di situs yang benar dan aman.',
        ),
        _buildTip(
          title: 'Gunakan Aplikasi Resmi',
          description:
              'Jika memungkinkan, gunakan aplikasi resmi dari penyedia layanan untuk melakukan transaksi, karena lebih aman daripada melalui situs web.',
        ),
      ],
    );
  }

  Widget _buildTip({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.lightbulb_outline,
            color: Colors.yellow,
            size: 24,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 2,
                        color: Colors.black,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 2,
                        color: Colors.black,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
