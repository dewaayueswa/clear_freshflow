import 'package:clear_fresh/screens/home_screen.dart';
import 'package:clear_fresh/screens/latihan_crud.dart';
import 'package:clear_fresh/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:clear_fresh/screens/news_screen.dart';
import 'package:clear_fresh/screens/track_location.dart';
import 'package:clear_fresh/screens/aboutus_screen.dart';
import 'package:clear_fresh/screens/chat_admin.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Delivery Personnel'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('D. Ayu Sri Widhi Astuti'),
              accountEmail: Text('ayundasrias@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/8b/43/cf/8b43cf0666f1a94637e7647e639f054b.jpg', // Ganti dengan URL gambar profil pengguna
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Fetch Data News'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Latihan CRUD SQLITE (Modul 2)'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LatihanCRUD()),
                );
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://graphicriver.img.customer.envatousercontent.com/files/252208930/preview.jpg?auto=compress%2Cformat&q=80&fit=crop&crop=top&max-h=8000&max-w=590&s=252162c94ade76f1f60623d72a149a65', // Ganti URL gambar yang sesuai
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                'Track your delivery personnel here:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrackLocationScreen()),
                      );
                    },
                    child: Text('Track'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatAdminScreen()),
                      );
                    },
                    child: Text('Chat Admin'),
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
