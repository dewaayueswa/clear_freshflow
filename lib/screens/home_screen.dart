import 'package:clear_fresh/screens/aboutus_screen.dart';
import 'package:clear_fresh/screens/latihan_crud.dart';
import 'package:clear_fresh/screens/login_screen.dart';
import 'package:clear_fresh/screens/news_screen.dart';
import 'package:clear_fresh/screens/order_screen.dart';
import 'package:clear_fresh/screens/profile_screen.dart';
import 'package:clear_fresh/screens/chat_admin.dart';
import 'package:clear_fresh/screens/track_location.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  'D. Ayu Sri Widhi Astuti',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  'ayundasrias@gmail.com',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/564x/8b/43/cf/8b43cf0666f1a94637e7647e639f054b.jpg',
                  ),
                ),
              ),
              ListTile(
                title: Text('Fetch Data News'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Latihan CRUD SQLITE'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LatihanCRUD(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Setting Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('About Us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUsScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Product Boxes
                buildProductBox(
                  imageUrl: 'assets/images/aqua.png',
                  text: 'Produk Aqua',
                  textColor: Colors.blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.0),
                buildProductBox(
                  imageUrl: 'assets/images/cleo.png',
                  text: 'Produk Cleo',
                  textColor: Colors.blue,
                  onTap: () {
                    //navigasi
                  },
                ),
                SizedBox(height: 16.0),
                buildProductBox(
                  imageUrl: 'assets/images/Le_mineral.png',
                  text: 'Produk Le Mineral',
                  textColor: Colors.blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.0),
                buildProductBox(
                  imageUrl: 'assets/images/pristine.png',
                  text: 'Produk Pristine',
                  textColor: Colors.blue,
                  onTap: () {
                    //nagivasi
                  },
                ),
                SizedBox(height: 16.0),
                buildProductBox(
                  imageUrl: 'assets/images/isi_ulang.png',
                  text: 'Order Isi Ulang',
                  textColor: Colors.blue,
                  onTap: () {
                    //navigasi
                  },
                ),
                SizedBox(height: 16.0),
                // Riwayat Order
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Riwayat Order',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        OrderTile(
                          orderId: '#12005',
                          status: 'In Progress',
                          onPressed: () {
                            // tambahan fungsi
                          },
                        ),
                        SizedBox(height: 12.0),
                        OrderTile(
                          orderId: '#10015',
                          status: 'Completed',
                          onPressed: () {
                            //navigasi
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                // Admin Chat
                buildAdminChat(
                  adminName: 'Rossa - Admin Siang',
                  lastMessage:
                      'Last message: Apakah Kakak ada keluhan dengan pelayanan Jasa kami?',
                  adminImageAssetPath: 'assets/images/admin1.jpg',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatAdminScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildProductBox({
    required String imageUrl,
    required String text,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: textColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAdminChat({
    required String adminName,
    required String lastMessage,
    required String adminImageAssetPath,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Admin Chat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(adminImageAssetPath),
              ),
              title: Text(adminName),
              subtitle: Text(lastMessage),
              trailing: ElevatedButton(
                onPressed: onPressed,
                child: Text('Chat Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderTile extends StatelessWidget {
  final String orderId;
  final String status;
  final VoidCallback onPressed;

  const OrderTile({
    Key? key,
    required this.orderId,
    required this.status,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.check_circle),
      title: Text('Order ID: $orderId'),
      subtitle: Text('Status: $status'),
      trailing: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TrackLocationScreen(),
            ),
          );
        },
        child: Text('View Details'),
      ),
    );
  }
}
