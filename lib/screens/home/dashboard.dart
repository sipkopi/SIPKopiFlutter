 import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/screens/home/head_home.dart';
import 'package:login_signup/screens/home/menu/harga_kopi.dart';
import 'package:login_signup/widgets/cards_widget.dart';
import 'package:login_signup/widgets/custom_button.dart';
import 'package:login_signup/widgets/card_widget.dart';
import 'package:login_signup/models/article.dart'; 
import 'package:login_signup/screens/home/menu/cuaca.dart';
import 'package:login_signup/screens/home/menu/penjadwalan.dart';
import 'package:login_signup/screens/home/menu/report.dart';
import 'package:login_signup/screens/home/menu/notifikasi.dart';
import 'package:login_signup/widgets/article_card.dart';
import 'package:url_launcher/url_launcher.dart'; 

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                const HeadHome(),
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 150,
                    width: 420,
                    child: AnotherCarousel(
                      images: const [
                        AssetImage('assets/images/card1.png'),
                        AssetImage('assets/images/card2.png'),
                        AssetImage('assets/images/card3.png'),
                      ],
                      dotSize: 5,
                      indicatorBgPadding: 5.0,
                      boxFit: BoxFit.cover,
          
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Menu Cepat",
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 63, 63, 63),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      key: UniqueKey(),
                      icon: Icons.book_online,
                      text: 'Laporan',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReportPage()),
                        );
                      },
                    ),
                    CustomButton(
                      key: UniqueKey(),
                      icon: Icons.cloudy_snowing,
                      text: 'Cuaca',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CuacaPage()),
                        );
                      },
                    ),
                    CustomButton(
                      key: UniqueKey(),
                      icon: Icons.calendar_month,
                      text: 'Penjadwalan',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PenjadwalanPage()),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CardsWidget(
                  key: UniqueKey(),
                  image: AssetImage('assets/images/harga_kopi.png'),
                  text: "Cek Harga Panen",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HargaKopi()),
                    );
                  },
                ),
                SizedBox(height: 10),
                  CardsWidget(
                  key: UniqueKey(),
                  image: AssetImage('assets/images/whatsapp.png'),
                  text: "Hubungi Admin",
                 onPressed: () async {
                  final url = Uri.parse('https://wa.me/6288803716911');
                  if (await canLaunchUrl(url)){
                    await launchUrl(url);
                    print('Clicked');
                  }
                },
                ),
                 SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Artikel",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                      
                      },
                      child: Text(
                        'Selengkapnya',
                        style: GoogleFonts.roboto(
                          color: Colors.blue,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      articles.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ArticleCard(article: articles[index]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
