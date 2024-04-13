import 'package:flutter/material.dart';

class KeamananAkun extends StatelessWidget {
  const KeamananAkun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keamanan Akun'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/keamanan.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Keamanan Akun Pengguna',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              _buildFeature(
                title: '1. Penggunaan Kata Sandi Kuat',
                description:
                    'Pengguna disarankan untuk menggunakan kata sandi yang kuat dan kompleks untuk melindungi akun dari akses yang tidak sah.',
              ),
              _buildFeature(
                title: '2. Verifikasi Dua Faktor (2FA)',
                description:
                    'Aktifkan verifikasi dua faktor (2FA) untuk menambah lapisan keamanan dengan mengirimkan kode verifikasi ke perangkat terpercaya pengguna.',
              ),
              _buildFeature(
                title: '3. Cek Aktivitas Login',
                description:
                    'Selalu periksa riwayat aktivitas login dan logout untuk mendeteksi akses yang mencurigakan atau tidak diakui.',
              ),
              SizedBox(height: 20),
              _buildMoreTips(),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // navigasi lanjutan
                  },
                  child: Text('Pahami Lebih Lanjut',
                      style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeature({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 28,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoreTips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tips Tambahan untuk Keamanan Akun:',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        _buildTip(
          title: 'Perbarui Aplikasi Secara Berkala',
          description:
              'Pastikan untuk selalu menginstal pembaruan keamanan dan perangkat lunak terbaru untuk melindungi akun dari kerentanan keamanan.',
        ),
        _buildTip(
          title: 'Jangan Gunakan Wi-Fi Publik untuk Transaksi Penting',
          description:
              'Hindari menggunakan jaringan Wi-Fi publik saat melakukan transaksi penting seperti login ke akun bank atau pembelian online yang sensitif.',
        ),
        _buildTip(
          title: 'Hati-hati dengan Email dan Pesan Phishing',
          description:
              'Waspadai email atau pesan palsu yang mencoba memperoleh informasi sensitif Anda dengan mengelabui Anda untuk mengklik tautan atau memberikan informasi pribadi.',
        ),
      ],
    );
  }

  Widget _buildTip({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.lightbulb_outline,
            color: Colors.yellow,
            size: 28,
          ),
          SizedBox(width: 10),
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
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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
