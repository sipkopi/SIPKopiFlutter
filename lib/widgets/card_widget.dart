import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const CardWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: 350,
        height: 130,
        padding: EdgeInsets.all(10), // Ubah nilai padding menjadi lebih besar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Tambahkan mainAxisSize: MainAxisSize.min
          children: [
            Icon(
              icon,
              size: 50,
              color: color,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
