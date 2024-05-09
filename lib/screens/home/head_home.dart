import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_signup/screens/home/menu/notifikasi.dart';

class HeadHome extends StatelessWidget {
  const HeadHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Selamat Datang\nNur Muhammad Fadli",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
          },
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.white,
            fixedSize: const Size(55, 55),
          ),
          icon: const Icon(Iconsax.notification),
        ),
      ],
    );
  }
}
