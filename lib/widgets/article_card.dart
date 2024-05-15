import 'package:flutter/material.dart';
import 'package:login_signup/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL(article.link);
      },
      child: Container(
        width: 300, // Atur lebar kartu
        height: 200, // Atur tinggi kartu sesuai kebutuhan Anda
        margin: EdgeInsets.only(right: 10.0), // Berikan jarak antar kartu
        child: Card(
          elevation: 3,
          child: Container(
            padding: EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 100, // Atur tinggi gambar sesuai kebutuhan Anda
                  width: 300, // Atur lebar gambar sesuai lebar kartu
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Melengkungkan sudut gambar
                    child: Image.asset(
                      article.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        article.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      // Ganti link dengan teks "Lihat Selengkapnya"
                      TextButton(
                        onPressed: () {
                          _launchURL(article.link);
                        },
                        child: Text(
                          'Lihat Selengkapnya',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuka tautan di browser
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}



class HorizontalArticleList extends StatelessWidget {
  final List<Article> articles;

  HorizontalArticleList({required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220, // Atur tinggi container agar sesuai dengan tinggi kartu
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleCard(article: articles[index]);
        },
      ),
    );
  }
}

// Contoh data artikel
final List<Article> articles = [
  Article(
    name: 'Mengenal Karakteristik Kopi Ijen',
    link: 'https://www.detik.com/jatim/kuliner/d-6346612/mengenal-kopi-ijen-yang-punya-cita-rasa-kacang-kacangan-dan-cokelat',
    image: 'assets/images/artikel5.jpg',
  ),
  Article(
    name: 'Mengenal Standar Mutu Kopi Ekspor',
    link: 'https://www.aeki-aice.org/mutu-kopi/',
    image: 'assets/images/artikel4.jpg',
  ),
  Article(
    name: 'Standar Ekspor Biji Kopi',
    link: 'https://www.cctcid.com/2018/08/29/beberapa-standard-pemeringkatan-mutu-biji-kopi-2/',
    image: 'assets/images/artikel5.jpg',
  ),
];

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Horizontal Article List'),
      ),
      body: HorizontalArticleList(articles: articles),
    ),
  ));
}
