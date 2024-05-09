import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final ImageProvider<Object> image;

  const CardWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(0),
        child: Image(image: image, fit: BoxFit.cover), // Mengatur gambar agar menyesuaikan ukuran container
      ),
    );
  }
}
