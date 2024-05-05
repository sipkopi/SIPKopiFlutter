import 'package:flutter/material.dart';
import 'package:login_signup/models/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Atur lebar kartu sesuai lebar layar
      height: 200, // Atur tinggi kartu sesuai kebutuhan Anda
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 100, // Atur tinggi gambar sesuai kebutuhan Anda
                width: MediaQuery.of(context).size.width, // Atur lebar gambar sesuai lebar layar
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Melengkungkan sudut gambar
                  child: Image.asset(
                    article.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
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
                    SizedBox(height: 1.0),
                    Text(
                      article.link,
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
