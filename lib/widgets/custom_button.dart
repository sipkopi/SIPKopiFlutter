import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onPressed; // Mengubah tipe dari Function menjadi void Function()

  const CustomButton({
    required Key key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      children: [
        InkWell(
          onTap: onPressed,
          child: Ink(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 224, 224, 224), // Warna latar belakang
              shape: BoxShape.circle, // Bentuk lingkaran
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                icon,
                size: 30,
                color: Colors.green, // Warna ikon
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            color: Colors.black, // Warna teks
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
