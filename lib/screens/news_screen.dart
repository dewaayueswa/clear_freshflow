import 'package:flutter/material.dart';
import 'package:clear_fresh/dto/news.dart';
import 'package:clear_fresh/services/data_service.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<List<News>>? _news;

  @override
  void initState() {
    super.initState();
    _news = DataService.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data News'),
        backgroundColor: Colors.blue, // Ganti warna app bar
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/background.jpg'), // Ganti latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: FutureBuilder<List<News>>(
            future: _news,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final post = snapshot.data![index];
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8), // Atur margin card
                      child: ListTile(
                        title: Text(
                          post.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Ganti warna teks judul
                          ),
                        ),
                        subtitle: Text(
                          post.body,
                          style: TextStyle(
                            color: Colors.grey[700], // Ganti warna teks konten
                          ),
                        ),
                        trailing: Icon(
                            Icons.arrow_forward_ios), // Ganti ikon trailing
                        onTap: () {
                          // Tambahkan aksi ketika list tile ditekan
                        },
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error}',
                    style: TextStyle(
                      color: Colors.red, // Ganti warna teks error
                    ),
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
